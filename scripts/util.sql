
-- to populate Comment bean objects
select distinct c.id,c.content,c.time,u.id,u.nickname,u.avatar,l.likes
from comment as c
    inner join user as u on c.user = u.id
    inner join (select comment,count(*) as likes from likeComment group by comment) as l on c.id = l.comment
order by time desc;


-- to populate ArticleSummary bean objects
select distinct a.id as id,title,content,cover,u.id as userId,nickname,avatar,time,likes
from article as a
    inner join user as u on a.user = u.id
    left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article


-- to populate an Article bean object
select distinct a.id as id,title,content,time,cover,u.id as userId,nickname,avatar,likes
from article as a
         inner join user as u on a.user = u.id
         left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article
where id = ?;



