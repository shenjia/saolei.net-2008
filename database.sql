delete Message
delete Player where Player_id > 1000
delete News where News_Player > 1000
delete Title where Title_Player > 1000
delete Video where Video_Player > 1000 or Video_CheckBy > 1000
delete Comment where Comment_Player > 1000
delete History where History_Player > 1000
update Player set Player_Name = Player_Id, Player_Question = '???', Player_Answer = '!!!', Player_Email = 'test@test.com', Player_Password = '1234', Player_Ip = NULL
