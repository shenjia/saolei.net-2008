
declare My_Cursor cursor for select Comment_Id from Comment 

declare @Comment_Id    bigint
declare @Comment_Text varchar(max)
declare @Checked_Text varchar(max)

open My_Cursor

fetch next from My_Cursor into @Comment_Id

while @@fetch_status=0  /*遍历数据库*/
begin

    select @Comment_Text = Comment_Text from Comment where Comment_Id=@Comment_Id
    set @Checked_Text = [dbo].[Check_Words](@Comment_Text)
    if @Comment_Text <> @Checked_Text 
        begin
            select * from Comment where Comment_Id=@Comment_Id
            update Comment set Comment_Text = [dbo].[Check_Words](@Comment_Text) where Comment_Id=@Comment_Id
        end
    fetch next from My_Cursor into @Comment_Id   /*下移游标并读用户ID*/

end

close My_Cursor /*关闭游标*/

deallocate My_Cursor    /*释放游标*/