      program pendulum
      real omega(300),teta(300),t(300)
      open(7,file="pend_out")
      print*, "Enter teta0"
      read(5,*) teta0
      print*, "Enter q"
      read(5,*) q
 111  format(2(2x,e11.5))
      pi=3.1415927
      teta=teta0*pi/180.0
      g=9.8
      s1=1.0
      freq=sqrt(g/s1)
      period=2.0*pi/freq
      tt=4.0*period
      dt=tt/300.0
      t(1)=0.0
      omega(1)=0.0
      teta(1)=teta0
      g1=g/s1
      do i=1,299
        t(i+1)=t(i)+dt
        omega(i+1)=omega(i)-(g1*teta(i)+q*omega(i))*dt
        teta(i+1)=teta(i)+omega(i+1)*dt
        write(7,111) t(i+1),teta(i+1)
      enddo
      end

