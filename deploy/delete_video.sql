
declare My_Cursor cursor for select Video_Id from Video where Video_Player = 26281 and Video_Id not in (245900,245867,245866,245865,224939,224940,224998,225001,225008,225058,225087,225088,225090,226324,226803,227168,227169,227176,227178,227291,227293,227303,227399,228015,228016,228017,228266,228267,228370,228451,228535,228556,228585,228674,228676,229166,229210,229274,229414,229498,229738,229739,229740,229820,229822,229826,229932,229933,229992,229993,230011,230044,230056,229993,230072,230073,231547,231557,231558,231559,231560,231561,231563,231564,231565,231568,231570,231571,231628,231633,231634,231664,231666,231693,231695,231700,231705,231707,231736,231741,231743,231750,231751,245196,241095,245599,233963,241215,234614,240184,245225,234142,243078,241364,241727,243070,239605,245488,240692,235305,233199,233851,233861,245561,245612,239672,233625,241764,232390)

declare @Video_Id    bigint

declare @out    varchar(500)

open My_Cursor

fetch next from My_Cursor into @Video_Id

while @@fetch_status=0  /*遍历数据库*/
begin

    execute Video_Freeze @Video_Id,1,@out,'cheating',@out

    fetch next from My_Cursor into @Video_Id   /*下移游标并读用户ID*/

end

close My_Cursor /*关闭游标*/

deallocate My_Cursor    /*释放游标*/