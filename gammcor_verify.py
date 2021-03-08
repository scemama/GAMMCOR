#! /usr/bin/env python
import os,sys,string,math,numpy
from numpy.testing import assert_allclose
from numpy.testing import assert_approx_equal

### functions reading components of SAPT
def elst(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" E1elst      =")
        S=s[a+18:a+31]
        return float(S)
#
def exch(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" E1exch(S2)  =")
        S=s[a+18:a+31]
        return float(S)
#
def ind(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" E2ind       =")
        S=s[a+18:a+31]
        return float(S)
#
def indBA(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" Ind(B<--A)     =")
        S=s[a+19:a+35]
        return float(S)
#
def indAB(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" Ind(A<--B)     =")
        S=s[a+19:a+35]
        return float(S)
#
def exch_ind(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" E2exch-ind  =")
        S=s[a+18:a+31]
        return float(S)
#
def disp(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" E2disp      =")
        S=s[a+18:a+31]
        return float(S)
#
def exch_disp(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" E2exch-disp =")
        S=s[a+18:a+31]
        return float(S)
#
#
def ac0_en(file):
	f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" ECASSCF+ENuc, AC0-Corr, AC0-CASSCF")
        S=s[a+70:a+83]
        return float(S)
#
def ac_en(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find("ECASSCF+ENuc, AC-Corr, AC-ERPA-CASSCF")
        S=s[a+75:a+89]
        return float(S)
#
def ac1_en(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" ECASSCF+ENuc, AC1-Corr, ERPA-CASSCF")
        S=s[a+74:a+88]
        return float(S)
#
def ac0d_en(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" Dexcitation correction for AC0 ")
        S=s[a+60:a+71]
        return float(S)
#
def ac0gvb_en(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find("  EGVB+ENuc, 0th+1st-order ECorr, AC0-GVB")
        S=s[a+78:a+91]
        return float(S)
#
def acgvb_en(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find("  EGVB+ENuc, Corr, AC-ERPA-GVB")
        S=s[a+66:a+80]
        return float(S)
#
def ac1gvb_en(file):
        f=open(file,'r')
	for line in f:
		if line[0:26] == " EGVB+ENuc, Corr, ERPA-GVB" :
			l=line.split(" ")
			le=len(l)-1
			l=l[le]
			S=l[0:len(l)-1]
        return float(S)
#
def eerpagvb_en(file):
        f=open(file,'r')
        for line in f:
                if line[0:24] == "  EGVB + ENuc + 1,2-body" :
                        l=line.split(" ")
                        le=len(l)-1
                        l=l[le]
                        S=l[0:len(l)-1]
        return float(S)
#
def caspidft_en(file):
        f=open(file,'r')
        s=f.read()
        f.close()
        a=s.find(" PiDFT Correlation")
        S=s[a+30:a+43]
        return float(S)
#
#
def run_single(dir,fun):
# run calc in dir and extract data with fun
	cwd=os.getcwd()
	wrkdir=cwd+"/"+dir
        os.chdir(wrkdir)
	os.system(cwd+"/gammcor > "+cwd+"/test.out")
	os.chdir(cwd)
	t=fun("test.out")
	os.system("rm test.out")
	return t
#
def reference(dirl,fun):
        ref_val=[]
        for dir in dirl:
                ref_val.append(fun(dir+"/gammcor.out"))
        return ref_val
#
def run_test(dirl,fun):
	ref_val=reference(dirl,fun)
	print 'ref :',ref_val
#
	test_val=[]
	for dir in dirl:
		test_val.append(run_single(dir,fun))
#	
	print 'test:',test_val
	try:
		assert_allclose(test_val,ref_val,rtol=0,atol=tolene)
		print 'passed with tol=',tolene,'[Ha] \n'
	except:
		print ' failed with errors:'
		print numpy.subtract(test_val,ref_val)	
	return 
#
def run_test_sapt(dirl):
#
	tolsapt=1.e-5
	ref_val=[]
        test_val=[]
	cwd=os.getcwd()
        for dir in dirl:
		wrkdir=cwd+"/"+dir
		os.chdir(wrkdir)
		os.system(cwd+"/gammcor > "+cwd+"/test.out")
		os.chdir(cwd)
# elst
                ref_val.append(elst(dir+"/gammcor.out"))
                test_val.append(elst("test.out"))
# exch
                ref_val.append(exch(dir+"/gammcor.out"))
                test_val.append(exch("test.out"))
# ind
                ref_val.append(ind(dir+"/gammcor.out"))
                test_val.append(ind("test.out"))
# indBA
                ref_val.append(indBA(dir+"/gammcor.out"))
                test_val.append(indBA("test.out"))
# indAB
                ref_val.append(indAB(dir+"/gammcor.out"))
                test_val.append(indAB("test.out"))
# exch_ind
                ref_val.append(exch_ind(dir+"/gammcor.out"))
                test_val.append(exch_ind("test.out"))
# disp
		ref_val.append(disp(dir+"/gammcor.out"))
		test_val.append(disp("test.out"))	
# exch_disp
		ref_val.append(exch_disp(dir+"/gammcor.out"))
                test_val.append(exch_disp("test.out"))   
#       
	print 'ref :',ref_val
        print 'test:',test_val
#
        try:
                assert_allclose(test_val,ref_val,rtol=0,atol=tolsapt)
                print 'passed with tol=',tolsapt,'[mHa] \n'
        except:
                print ' failed with errors:'
                print numpy.subtract(test_val,ref_val)
        return
#
###### BEGIN TESTS ######
## SAPT(CAS) ##
dir_sapt=["TESTS/SAPT/TEST1"]
#
#
tolene=1.e-7
## AC0 ##
dir_ac0=["TESTS/AC0/TEST1","TESTS/AC0/TEST1/INCORE_INTEG" \
        ]
#         ,"TESTS/AC0/TEST2", \
#         "TESTS/AC0/TEST2/INCORE_INTEG"]
## AC ##
dir_ac=["TESTS/AC/TEST1","TESTS/AC/TEST1/INCORE_INTEG"]
## AC1 ##
dir_ac1=["TESTS/AC1/TEST1","TESTS/AC1/TEST1/INCORE_INTEG"]
## AC0D ##
dir_ac0d=["TESTS/AC0D/TEST2"]
## CASPIDFT ##
dir_caspidft=["TESTS/CASPIDFT/TEST1","TESTS/CASPIDFT/TEST2"]
## AC0-GVB ##
dir_ac0gvb=["TESTS/AC0GVB/TEST1","TESTS/AC0GVB/TEST1/INCORE_INTEG"]
## AC-GVB ##
dir_acgvb=["TESTS/ACGVB/TEST1","TESTS/ACGVB/TEST1/INCORE_INTEG"]
## AC1-GVB ##
dir_ac1gvb=["TESTS/AC1GVB/TEST1","TESTS/AC1GVB/TEST1/INCORE_INTEG"]
## EERPA-GVB ##
dir_eerpagvb=["TESTS/EERPAGVB/TEST1","TESTS/EERPAGVB/TEST2","TESTS/EERPAGVB/TEST3","TESTS/EERPAGVB/TEST4"]
## AC0_DALTON WITH CASSCF ##
dir_ac0dalton=["TESTS/AC0_DALTON/TEST1","TESTS/AC0_DALTON/TEST1/INCORE","TESTS/AC0_DALTON/TEST2","TESTS/AC0_DALTON/TEST2/INCORE"]
## AC0_DALTON WITH HF WAVEFUNCTION ##
dir_ac0_hf_dalton=["TESTS/AC0_HF_DALTON"]
#
# run tests
#
print "* testing SAPT energy components"
run_test_sapt(dir_sapt)
#
print "* testing EERPA-GVB energy"
run_test(dir_eerpagvb,eerpagvb_en)
#
print "* testing AC0-GVB energy"
run_test(dir_ac0gvb,ac0gvb_en)
#
print "* testing AC-GVB energy"
run_test(dir_acgvb,acgvb_en)
#
print "* testing AC1-GVB energy"
run_test(dir_ac1gvb,ac1gvb_en)
#
print "* testing AC0-CAS[molpro] energy"
run_test(dir_ac0,ac0_en)
#
print "* testing AC0-CAS[dalton] energy"
run_test(dir_ac0dalton,ac0_en)
#
print "* testing AC0-HF[dalton] energy"
run_test(dir_ac0_hf_dalton,ac0_en)
#
print "* testing AC-CAS[molpro] energy"
run_test(dir_ac,ac_en)
#
print "* testing AC1-CAS[molpro] energy"
run_test(dir_ac1,ac1_en)
#
print "* testing PIDFT energy"
run_test(dir_caspidft,caspidft_en)
#
print "* testing AC0D-CAS[molpro]"
run_test(dir_ac0d,ac0d_en)


