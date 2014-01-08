nextgentel-inteno-x5668b
========================

Debugging scripts for Inteno X5668B router.

This project was created due to bad service provided by NextGenTel internet service provider in Norway. Theses scripts was created so that other subscribers can verify that the Internet speed at their own home. Subscribers of NextGenTel have to mandatory rent the Inteno X5668B router.

```
ping -n 2 www.nextgentel.no 
Test-Connection -Count 2 -Verbose www.nextgentel.no
```

```
C:\>telnet 10.0.0.1 23
DSL Router.  Welcome!
Login: admin
Password: VebBfB1963
>
> sntp date
Sat Jan  4 18:55:10 2014
> adsl info
adsl: ADSL driver and PHY status
Status: Showtime
Retrain Reason: 8000
Max:    Upstream rate = 833 Kbps, Downstream rate = 1676 Kbps
Path:   0, Upstream rate = 573 Kbps, Downstream rate = 371 Kbps
> logout
Logged out.
```

With NextGenTel, you do not get what you have paid. Veldig dårlig tjenesten. At least, that is my experience.
