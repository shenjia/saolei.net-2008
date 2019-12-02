
declare My_Cursor cursor for select Title_Id from Title 

declare @Title_Id    bigint
declare @Title_Text varchar(max)
declare @Title_Name varchar(max)
declare @Checked_Text varchar(max)
declare @Checked_Name varchar(max)

open My_Cursor

fetch next from My_Cursor into @Title_Id

while @@fetch_status=0  /*遍历数据库*/
begin
    
    select @Title_Text = Title_Text, @Title_Name = Title_Name from Title where Title_Id=@Title_Id
    set @Checked_Text = [dbo].[Check_Words](@Title_Text)
    set @Checked_Name = [dbo].[Check_Words](@Title_Name)

    if @Title_Text <> @Checked_Text or @Title_Name <> @Checked_Name
        begin
            select @Title_Name, @Title_Text
            update Title set Title_Name = [dbo].[Check_Words](Title_Name), Title_Text = [dbo].[Check_Words](@Title_Text) where Title_Id=@Title_Id
        end
    fetch next from My_Cursor into @Title_Id   /*下移游标并读用户ID*/

end

close My_Cursor /*关闭游标*/

deallocate My_Cursor    /*释放游标*/