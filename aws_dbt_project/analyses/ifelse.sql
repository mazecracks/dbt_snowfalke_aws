
----------
{% set flag = False %}

select * from {{ref("bronze_bookings")}}

{%if flag  == true %}
    where nights_booked > 1
{% else %}
    where nights_booked = 1
{% endif %}

-------
{% set nights_booked = 6 %}
select * from {{ref("bronze_bookings")}}
where nights_booked > {{nights_booked}} 


