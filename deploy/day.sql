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

declare @Day bigint,@Last bigint

set @Day='30'
set @Last='29'

while @Day>0
	begin
                exec('EXEC sp_rename '+@Day+','+@Last)
		set @Day=@Day-1
		set @Last=@Last-1
	end

select Player_Id,Player_Real_Rank into Rank_1 from player


declare My_Cursor cursor for select Player_Id from Player where Player_Rank>0

declare @Player_Old_Rank	bigint

open My_Cursor

fetch next from My_Cursor into @Player_Id

while @@fetch_status=0	/*遍历数据库*/
begin
	
	if exists(select Player_Id from Rank_30 where Player_Id=@Player_Id)
		begin
			select @Player_Old_Rank=Player_Real_Rank from Rank_30 where Player_Id=@Player_Id

			update Player set Player_Old_Rank=@Player_Old_Rank,Player_Rank_Grow=@Player_Old_Rank - Player_Real_Rank + 0.0001 * Player_Real_Rank
			 where Player_Id=@Player_Id	/*给用户赋上月排行值*/	

		end
	fetch next from My_Cursor into @Player_Id	/*下移游标并读用户ID*/

end

close My_Cursor	/*关闭游标*/

deallocate My_Cursor	/*释放游标*/