update Counter set Counter_Today=0

update Player set Player_Click_Today=0,Player_Click_IP=''

update Player set	Player_Click_Today=floor(Player_Click_Today)+0.000000001*Player_Id+0.00001*Player_Click,
			Player_Click=floor(Player_Click)+0.000000001*Player_Id+0.00001*Player_Click_Today
			
declare @Player_Id 		bigint		

if exists(select Player_Id from Player where (Player_Rank_Grow>1 or Player_IsHero=1) and Player_IsLive=1 and Player_IsStar=0)

	begin
		select top 1	@Player_Id=Player_Id from (select Player_Id,newid() n from Player where (Player_Rank_Grow>1 or Player_IsHero=1) and Player_IsLive=1 and Player_IsStar=0)a order by n 
	
		update Star set Player_Id=@Player_Id
	end
else
	begin
		select top 1	@Player_Id=Player_Id from (select Player_Id,newid() n from Player where (Player_Rank_Grow>1 or Player_IsHero=1)  and Player_IsStar=0)a order by n 
	
		update Star set Player_Id=@Player_Id
	end
update Player set Player_IsStar=1 where Player_Id=@Player_Id

delete Message where Message_Time<dateadd(dd,-7,getdate())

DECLARE @SQL VARCHAR(MAX);
DECLARE @tableName VARCHAR(100);
set @tableName = 'Rank_31'
SET @SQL = 'IF EXISTS(SELECT 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N''' + @tableName + ''') AND type = (N''U'')) DROP TABLE [' + @tableName + ']'
EXEC (@SQL);

declare @Day bigint,@Last bigint

set @Day='30'
set @Last='31'

while @Day>0
	begin
        exec('EXEC sp_rename Rank_'+@Day+', Rank_'+@Last)
		set @Day=@Day-1
		set @Last=@Last-1
	end

select Player_Id,Player_Real_Rank into Rank_1 from player
