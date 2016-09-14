select count(1) from employee;

select count(1) from customer;

select *
from artist
left join album on album.artistid = artist.artistid
where albumid is null;

select 
artist.name,
count(1) as num_albums
from artist,
album 
where artist.artistid = album.artistid
group by artist.name
order by num_albums desc;

select *
from track,
mediatype
where track.mediatypeid = mediatype.mediatypeid
and mediatype.mediatypeid == 3
and track.milliseconds == (select max(track.milliseconds) from track, mediatype where track.mediatypeid = mediatype.mediatypeid and  mediatype.mediatypeid == 3);

select 
customer.country,
count(distinct customer.customerid) as num_customers,
count(1) as num_tracks,
sum(invoiceline.unitprice) as total_cost
from customer,
invoice,
invoiceline,
track,
mediatype
where customer.customerid = invoice.customerid
and invoice.invoiceid = invoiceline.invoicelineid
and invoiceline.trackid = track.trackid
and track.mediatypeid = mediatype.mediatypeid
and mediatype.mediatypeid != 3
group by customer.country;

select 
customer.firstname,
customer.lastname
from employee,
customer
where employee.city = customer.city
and employee.country = customer.country
and employee.reportsto is null;
