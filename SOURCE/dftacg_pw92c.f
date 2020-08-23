      SUBROUTINE dftacg_pw92c
     > (name,fderiv,open,igrad,npt,rhoc,rhoo,
     >                   sigmacc,sigmaco,sigmaoo,
     >                   zk,vrhoc,vrhoo,
     >                   vsigmacc,vsigmaco,vsigmaoo)
      IMPLICIT DOUBLE PRECISION (a-h,o-z)
      LOGICAL fderiv,open
      INTEGER igrad,npt
      CHARACTER*(*) name
      DOUBLE PRECISION rhoc(*),rhoo(*)
      DOUBLE PRECISION sigmacc(*),sigmaco(*),sigmaoo(*)
      DOUBLE PRECISION zk(*),vrhoc(*),vrhoo(*)
      DOUBLE PRECISION vsigmacc(*),vsigmaco(*),vsigmaoo(*)
      INCLUDE "cdft"
      INCLUDE "tapes"
      PARAMETER(tol=1d-12)
      name='Automatically generated PW92C'
      igrad=0
      if(open) then
        if(fderiv) then
          do i=1,npt
            zk(i)=0.0d0
            if(rhoc(i).gt.tol) then
      t2 = 0.500000000000000000000D0 * rhoc(i)
      t3 = rhoo(i)
      rhoa = dmax1(0.0D0, t2 + 0.500000000000000000000D0 * t3)
      rhob = dmax1(0.0D0, t2 - 0.5000000000D0 * t3)
      rho = rhoa + rhob
      t1 = 0.1D1 / rho
      t2 = t1 ** (0.1D1 / 0.3D1)
      t4 = 0.1D1 + 0.132568899905201783561D0 * t2
      t5 = t1 ** (0.1D1 / 0.6D1)
      t8 = dsqrt(t1)
      t10 = t2 ** 2
      t12 = 0.598255043577107980801D1 * t5 + 0.222556942115068749979D1 *
     # t2 + 0.800428634999363415534D0 * t8 + 0.189700432574755857775D0 *
     # t10
      t15 = 0.1D1 + 0.160818243221511048214D2 / t12
      t16 = dlog(t15)
      t18 = 0.62182D-1 * t4 * t16
      t20 = 0.1D1 + 0.690139921125582518540D-1 * t2
      t25 = 0.815741470348764084569D1 * t5 + 0.224759186357761620038D1 *
     # t2 + 0.430097247127664290171D0 * t8 + 0.191151259512733764992D0 *
     # t10
      t28 = 0.1D1 + 0.296085746432166755492D2 / t25
      t29 = dlog(t28)
      t30 = t20 * t29
      t32 = rhoa - 0.1D1 * rhob
      t33 = t32 * t1
      t34 = 0.1D1 + t33
      t35 = t34 ** (0.1D1 / 0.3D1)
      t38 = 0.1D1 - 0.1D1 * t33
      t39 = t38 ** (0.1D1 / 0.3D1)
      t41 = t35 * t34 + t39 * t38 - 0.2D1
      t42 = t32 ** 2
      t43 = t42 ** 2
      t44 = rho ** 2
      t45 = t44 ** 2
      t46 = 0.1D1 / t45
      t47 = t43 * t46
      t49 = 0.1D1 - 0.1D1 * t47
      t52 = 0.379957485370152817954D-1 * t30 * t41 * t49
      t54 = 0.1D1 + 0.127469618870008715424D0 * t2
      t59 = 0.111203748630946849798D2 * t5 + 0.384474623744721148328D1 *
     # t2 + 0.164473377556760904003D1 * t8 + 0.240587129128819165832D0 *
     # t10
      t62 = 0.1D1 + 0.321646831778706979736D2 / t59
      t63 = dlog(t62)
      t66 = -0.31090D-1 * t54 * t63 + t18
      t67 = t66 * t41
      t69 = 0.192366105093153631974D1 * t67 * t47
      zk(i) = rho * (-t18 + t52 + t69)
      t73 = 0.1D1 / t44
      t74 = 0.1D1 / t10 * t73
      t75 = t74 * t16
      t76 = 0.274779977796841910181D-2 * t75
      t77 = t12 ** 2
      t80 = t5 ** 2
      t81 = t80 ** 2
      t84 = 0.1D1 / t81 / t5 * t73
      t88 = 0.1D1 / t8 * t73
      t91 = 0.1D1 / t2 * t73
      t96 = t4 / t77 * (-0.9970917393D0 * t84 - 0.7418564737D0 * t74 - 0
     #.4002143175D0 * t88 - 0.1264669550D0 * t91) / t15
      t97 = 0.100000000000000000000D1 * t96
      t101 = 0.8740794299D-3 * t74 * t29 * t41 * t49
      t102 = t25 ** 2
      t115 = 0.1124999957D1 * t20 / t102 * (-0.1359569117D1 * t84 - 0.74
     #91972879D0 * t74 - 0.2150486236D0 * t88 - 0.1274341730D0 * t91) /
     #t28 * t41 * t49
      t116 = t32 * t73
      t117 = 0.1D1 * t116
      t121 = 0.1D1 * t1
      t125 = 0.133333333333333333333D1 * t35 * (t1 - t117) + 0.133333333
     #333333333333D1 * t39 * (-t121 + t116)
      t130 = t42 * t32 * t46
      t131 = 0.4D1 * t130
      t134 = t43 / t45 / rho
      t135 = 0.4D1 * t134
      t142 = t59 ** 2
      t159 = 0.192366105093153631974D1 * (0.132101015022285698752D-2 * t
     #74 * t63 + 0.999999999999999999999D0 * t54 / t142 * (-0.1853395811
     #D1 * t84 - 0.1281582079D1 * t74 - 0.8223668878D0 * t88 - 0.1603914
     #194D0 * t91) / t62 - 0.2747799778D-2 * t75 - 0.1000000000D1 * t96)
     # * t41 * t47
      t163 = t67 * t130
      t166 = 0.7694644204D1 * t67 * t134
      t169 = 0.500000000000000000000D0 * rho * (t76 + t97 - t101 - t115
     #+ 0.379957485370152817954D-1 * t30 * t125 * t49 + 0.37995748537015
     #2817954D-1 * t30 * t41 * (-t131 + t135) + t159 + 0.192366105093153
     #631974D1 * t66 * t125 * t47 + 0.769464420372614527896D1 * t163 - t
     #166)
      t176 = 0.133333333333333333333D1 * t35 * (-t121 - t117) + 0.133333
     #333333333333333D1 * t39 * (t1 + t116)
      t189 = rho * (t76 + t97 - t101 - t115 + 0.379957485370152817954D-1
     # * t30 * t176 * t49 + 0.379957485370152817954D-1 * t30 * t41 * (t1
     #31 + t135) + t159 + 0.192366105093153631974D1 * t66 * t176 * t47 -
     # 0.7694644204D1 * t163 - t166)
      vrhoc(i) = vrhoc(i) + t169 + 0.500000000000000000000D0 * t189 - t1
     #8 + t52 + t69
      vrhoo(i) = vrhoo(i) + t169 - 0.5000000000D0 * t189
            endif
          enddo
        else
          do i=1,npt
            zk(i)=0.0d0
            if(rhoc(i).gt.tol) then
      t2 = 0.500000000000000000000D0 * rhoc(i)
      t3 = rhoo(i)
      rhoa = dmax1(0.0D0, t2 + 0.500000000000000000000D0 * t3)
      rhob = dmax1(0.0D0, t2 - 0.5000000000D0 * t3)
      rho = rhoa + rhob
      t1 = 0.1D1 / rho
      t2 = t1 ** (0.1D1 / 0.3D1)
      t5 = t1 ** (0.1D1 / 0.6D1)
      t8 = dsqrt(t1)
      t10 = t2 ** 2
      t16 = dlog(0.1D1 + 0.160818243221511048214D2 / (0.5982550435771079
     #80801D1 * t5 + 0.222556942115068749979D1 * t2 + 0.8004286349993634
     #15534D0 * t8 + 0.189700432574755857775D0 * t10))
      t18 = 0.62182D-1 * (0.1D1 + 0.132568899905201783561D0 * t2) * t16
      t29 = dlog(0.1D1 + 0.296085746432166755492D2 / (0.8157414703487640
     #84569D1 * t5 + 0.224759186357761620038D1 * t2 + 0.4300972471276642
     #90171D0 * t8 + 0.191151259512733764992D0 * t10))
      t32 = rhoa - 0.1D1 * rhob
      t33 = t32 * t1
      t34 = 0.1D1 + t33
      t35 = t34 ** (0.1D1 / 0.3D1)
      t38 = 0.1D1 - 0.1D1 * t33
      t39 = t38 ** (0.1D1 / 0.3D1)
      t41 = t35 * t34 + t39 * t38 - 0.2D1
      t42 = t32 ** 2
      t43 = t42 ** 2
      t44 = rho ** 2
      t45 = t44 ** 2
      t47 = t43 / t45
      t63 = dlog(0.1D1 + 0.321646831778706979736D2 / (0.1112037486309468
     #49798D2 * t5 + 0.384474623744721148328D1 * t2 + 0.1644733775567609
     #04003D1 * t8 + 0.240587129128819165832D0 * t10))
      zk(i) = rho * (-t18 + 0.379957485370152817954D-1 * (0.1D1 + 0.6901
     #39921125582518540D-1 * t2) * t29 * t41 * (0.1D1 - 0.1D1 * t47) + 0
     #.192366105093153631974D1 * (-0.31090D-1 * (0.1D1 + 0.1274696188700
     #08715424D0 * t2) * t63 + t18) * t41 * t47)
            endif
          enddo
        endif
      else
        if(fderiv) then
          do i=1,npt
            zk(i)=0.0d0
            if(rhoc(i).gt.tol) then
      rhoa = dmax1(0.0D0, 0.500000000000000000000D0 * rhoc(i))
      rhob = rhoa
      rho = rhoa + rhob
      t3 = 0.1D1 / rho
      t4 = t3 ** (0.1D1 / 0.3D1)
      t6 = 0.1D1 + 0.132568899905201783561D0 * t4
      t7 = t3 ** (0.1D1 / 0.6D1)
      t10 = dsqrt(t3)
      t12 = t4 ** 2
      t14 = 0.598255043577107980801D1 * t7 + 0.222556942115068749979D1 *
     # t4 + 0.800428634999363415534D0 * t10 + 0.189700432574755857775D0
     #* t12
      t17 = 0.1D1 + 0.160818243221511048214D2 / t14
      t18 = dlog(t17)
      t20 = 0.62182D-1 * t6 * t18
      t22 = 0.1D1 + 0.690139921125582518540D-1 * t4
      t27 = 0.815741470348764084569D1 * t7 + 0.224759186357761620038D1 *
     # t4 + 0.430097247127664290171D0 * t10 + 0.191151259512733764992D0
     #* t12
      t30 = 0.1D1 + 0.296085746432166755492D2 / t27
      t31 = dlog(t30)
      t32 = t22 * t31
      t34 = rhoa - 0.1D1 * rhob
      t35 = t34 * t3
      t36 = 0.1D1 + t35
      t37 = t36 ** (0.1D1 / 0.3D1)
      t40 = 0.1D1 - 0.1D1 * t35
      t41 = t40 ** (0.1D1 / 0.3D1)
      t43 = t37 * t36 + t41 * t40 - 0.2D1
      t44 = t34 ** 2
      t45 = t44 ** 2
      t46 = rho ** 2
      t47 = t46 ** 2
      t48 = 0.1D1 / t47
      t49 = t45 * t48
      t51 = 0.1D1 - 0.1D1 * t49
      t54 = 0.379957485370152817954D-1 * t32 * t43 * t51
      t56 = 0.1D1 + 0.127469618870008715424D0 * t4
      t61 = 0.111203748630946849798D2 * t7 + 0.384474623744721148328D1 *
     # t4 + 0.164473377556760904003D1 * t10 + 0.240587129128819165832D0
     #* t12
      t64 = 0.1D1 + 0.321646831778706979736D2 / t61
      t65 = dlog(t64)
      t68 = -0.31090D-1 * t56 * t65 + t20
      t69 = t68 * t43
      t71 = 0.192366105093153631974D1 * t69 * t49
      zk(i) = rho * (-t20 + t54 + t71)
      t75 = 0.1D1 / t46
      t76 = 0.1D1 / t12 * t75
      t77 = t76 * t18
      t78 = 0.274779977796841910181D-2 * t77
      t79 = t14 ** 2
      t82 = t7 ** 2
      t83 = t82 ** 2
      t86 = 0.1D1 / t83 / t7 * t75
      t90 = 0.1D1 / t10 * t75
      t93 = 0.1D1 / t4 * t75
      t98 = t6 / t79 * (-0.9970917393D0 * t86 - 0.7418564737D0 * t76 - 0
     #.4002143175D0 * t90 - 0.1264669550D0 * t93) / t17
      t99 = 0.100000000000000000000D1 * t98
      t103 = 0.8740794299D-3 * t76 * t31 * t43 * t51
      t104 = t27 ** 2
      t117 = 0.1124999957D1 * t22 / t104 * (-0.1359569117D1 * t86 - 0.74
     #91972879D0 * t76 - 0.2150486236D0 * t90 - 0.1274341730D0 * t93) /
     #t30 * t43 * t51
      t118 = t34 * t75
      t119 = 0.1D1 * t118
      t123 = 0.1D1 * t3
      t127 = 0.133333333333333333333D1 * t37 * (t3 - t119) + 0.133333333
     #333333333333D1 * t41 * (-t123 + t118)
      t132 = t44 * t34 * t48
      t133 = 0.4D1 * t132
      t136 = t45 / t47 / rho
      t137 = 0.4D1 * t136
      t144 = t61 ** 2
      t161 = 0.192366105093153631974D1 * (0.132101015022285698752D-2 * t
     #76 * t65 + 0.999999999999999999999D0 * t56 / t144 * (-0.1853395811
     #D1 * t86 - 0.1281582079D1 * t76 - 0.8223668878D0 * t90 - 0.1603914
     #194D0 * t93) / t64 - 0.2747799778D-2 * t77 - 0.1000000000D1 * t98)
     # * t43 * t49
      t165 = t69 * t132
      t168 = 0.7694644204D1 * t69 * t136
      t178 = 0.133333333333333333333D1 * t37 * (-t123 - t119) + 0.133333
     #333333333333333D1 * t41 * (t3 + t118)
      vrhoc(i) = vrhoc(i) + 0.5D0 * rho * (t78 + t99 - t103 - t117 + 0.3
     #79957485370152817954D-1 * t32 * t127 * t51 + 0.3799574853701528179
     #54D-1 * t32 * t43 * (-t133 + t137) + t161 + 0.19236610509315363197
     #4D1 * t68 * t127 * t49 + 0.769464420372614527896D1 * t165 - t168)
     #+ 0.5D0 * rho * (t78 + t99 - t103 - t117 + 0.379957485370152817954
     #D-1 * t32 * t178 * t51 + 0.379957485370152817954D-1 * t32 * t43 *
     #(t133 + t137) + t161 + 0.192366105093153631974D1 * t68 * t178 * t4
     #9 - 0.7694644204D1 * t165 - t168) - t20 + t54 + t71
            endif
          enddo
        else
          do i=1,npt
            zk(i)=0.0d0
            if(rhoc(i).gt.tol) then
      rhoa = dmax1(0.0D0, 0.500000000000000000000D0 * rhoc(i))
      rhob = rhoa
      rho = rhoa + rhob
      t3 = 0.1D1 / rho
      t4 = t3 ** (0.1D1 / 0.3D1)
      t7 = t3 ** (0.1D1 / 0.6D1)
      t10 = dsqrt(t3)
      t12 = t4 ** 2
      t18 = dlog(0.1D1 + 0.160818243221511048214D2 / (0.5982550435771079
     #80801D1 * t7 + 0.222556942115068749979D1 * t4 + 0.8004286349993634
     #15534D0 * t10 + 0.189700432574755857775D0 * t12))
      t20 = 0.62182D-1 * (0.1D1 + 0.132568899905201783561D0 * t4) * t18
      t31 = dlog(0.1D1 + 0.296085746432166755492D2 / (0.8157414703487640
     #84569D1 * t7 + 0.224759186357761620038D1 * t4 + 0.4300972471276642
     #90171D0 * t10 + 0.191151259512733764992D0 * t12))
      t34 = rhoa - 0.1D1 * rhob
      t35 = t34 * t3
      t36 = 0.1D1 + t35
      t37 = t36 ** (0.1D1 / 0.3D1)
      t40 = 0.1D1 - 0.1D1 * t35
      t41 = t40 ** (0.1D1 / 0.3D1)
      t43 = t37 * t36 + t41 * t40 - 0.2D1
      t44 = t34 ** 2
      t45 = t44 ** 2
      t46 = rho ** 2
      t47 = t46 ** 2
      t49 = t45 / t47
      t65 = dlog(0.1D1 + 0.321646831778706979736D2 / (0.1112037486309468
     #49798D2 * t7 + 0.384474623744721148328D1 * t4 + 0.1644733775567609
     #04003D1 * t10 + 0.240587129128819165832D0 * t12))
      zk(i) = rho * (-t20 + 0.379957485370152817954D-1 * (0.1D1 + 0.6901
     #39921125582518540D-1 * t4) * t31 * t43 * (0.1D1 - 0.1D1 * t49) + 0
     #.192366105093153631974D1 * (-0.31090D-1 * (0.1D1 + 0.1274696188700
     #08715424D0 * t4) * t65 + t20) * t43 * t49)
            endif
          enddo
        endif
      endif

      RETURN
      END SUBROUTINE dftacg_PW92C

