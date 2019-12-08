
declare My_Cursor cursor for select Player_Id from Player 

declare @Player_Id    bigint
declare @Player_Interest varchar(max)
declare @Checked_Interest varchar(max)

open My_Cursor

fetch next from My_Cursor into @Player_Id

while @@fetch_status=0  /*遍历数据库*/
begin

    select @Player_Interest = Player_Interest from Player where Player_Id=@Player_Id
    set @Checked_Interest = [dbo].[Check_Words](@Player_Interest)
    if @Player_Interest <> @Checked_Interest 
        begin
            select * from Player where Player_Id=@Player_Id
            update Player set Player_Interest = [dbo].[Check_Words](@Player_Interest) where Player_Id=@Player_Id
        end
    fetch next from My_Cursor into @Player_Id   /*下移游标并读用户ID*/

end

close My_Cursor /*关闭游标*/

deallocate My_Cursor    /*释放游标*/