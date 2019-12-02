
declare My_Cursor cursor for select History_Id from History 

declare @History_Id    bigint
declare @History_Text varchar(max)
declare @Checked_Text varchar(max)

open My_Cursor

fetch next from My_Cursor into @History_Id

while @@fetch_status=0  /*遍历数据库*/
begin

    select @History_Text = History_Text from History where History_Id=@History_Id
    set @Checked_Text = [dbo].[Check_Words](@History_Text)
    if @History_Text <> @Checked_Text 
        begin
            select * from History where History_Id=@History_Id
            update History set History_Text = [dbo].[Check_Words](@History_Text) where History_Id=@History_Id
        end
    fetch next from My_Cursor into @History_Id   /*下移游标并读用户ID*/

end

close My_Cursor /*关闭游标*/

deallocate My_Cursor    /*释放游标*/