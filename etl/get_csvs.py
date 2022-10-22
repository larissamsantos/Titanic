import pandas as pd

def get_id_column(df):
    ids = []
    lenght = df.shape[0]
    for number in range(1,lenght+1):
        ids.append(number)
    return ids

data_source = pd.read_csv('train.csv')

Pclass = pd.DataFrame()
Pclass['Class'] = data_source['Pclass']
Pclass = Pclass.drop_duplicates()
Pclass.sort_values(by='Class',inplace=True)
description = ['First class','Second class', 'Third class']
Pclass['Description'] = description
Pclass['Id'] = get_id_column(Pclass)
Pclass = Pclass[["Id", "Class", "Description"]]
Pclass.to_csv('Pclass.csv', index=False)

Embarked = pd.DataFrame()
Embarked['Port'] = data_source['Embarked']
Embarked = Embarked.drop_duplicates()
Embarked.sort_values(by='Port',inplace=True)
Embarked.dropna(inplace=True)
description_embarked = ['Cherbourg','Queenstown', 'Southampton']
Embarked['Description'] = description_embarked
Embarked['Id'] = get_id_column(Embarked)
Embarked = Embarked[["Id", "Port", "Description"]]
Embarked.to_csv('Embarked.csv', index=False)

Ticket = pd.DataFrame()
Ticket['Ticket'] = data_source['Ticket']
Ticket['Fare'] = data_source['Fare']
Ticket['Pclass_id'] = data_source['Pclass']
Ticket.drop_duplicates(inplace=True)
Ticket['Id'] = get_id_column(Ticket)
Ticket = Ticket[["Id", "Ticket", "Fare", "Pclass_id"]]
Ticket.to_csv('Ticket.csv', index=False)

Cabin = pd.DataFrame()
Cabin['Cabin'] = data_source['Cabin']
Cabin.drop_duplicates(inplace=True)
Cabin.dropna(inplace=True)
Cabin['Id'] = get_id_column(Cabin)
Cabin = Cabin[["Id", "Cabin"]]
Cabin.to_csv('Cabin.csv', index=False)

Sex = pd.DataFrame()
Sex['Sex'] = data_source['Sex']
Sex.drop_duplicates(inplace=True)
Sex.dropna(inplace=True)
Sex['Id'] = get_id_column(Sex)
Sex = Sex[["Id", "Sex"]]
Sex.to_csv('Sex.csv', index=False)

Passenger = pd.DataFrame()
Passenger['Id'] = data_source['PassengerId']
Passenger['Name'] = data_source['Name']
Passenger['Sex'] = data_source['Sex']
Passenger['Age'] = data_source['Age']
Passenger['SibSp'] = data_source['SibSp']
Passenger['Parch'] = data_source['Parch']
Passenger['Embarked'] = data_source['Embarked']
Passenger['Ticket'] = data_source['Ticket']
Passenger['Cabin'] = data_source['Cabin']
Embarked_dict = dict(zip(Embarked.Port, Embarked.Id))
Passenger['Embarked'].replace(to_replace = Embarked_dict, inplace=True)
Ticket_dict = dict(zip(Ticket.Ticket, Ticket.Id))
Passenger['Ticket'].replace(to_replace = Ticket_dict, inplace=True)
Cabin_dict = dict(zip(Cabin.Cabin, Cabin.Id))
Passenger['Cabin'].replace(to_replace = Cabin_dict, inplace=True)
Sex_dict = dict(zip(Sex.Sex, Sex.Id))
Passenger['Sex'].replace(to_replace = Sex_dict, inplace=True)
Passenger.to_csv('Passenger.csv', index=False)

Survival_status = pd.DataFrame()
Survival_status['Passenger_id'] = data_source['PassengerId']
Survival_status['Status'] = data_source['Survived']
Survival_status.to_csv('Survival_status.csv', index=False)