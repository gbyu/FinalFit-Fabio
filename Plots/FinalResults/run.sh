DATE="25_10_2019"
OUTPUTDIR="output/"
SYSTEMATICS="_systematics"
OUTTAG="_SMgenerated_"${DATE}${SYSTEMATICS}
DATACARD="Datacards/cms_HHbbgg_datacard_SMgenerated_${DATE}${SYSTEMATICS}.txt"

if [[ "$SYSTEMATICS" == "_systematics" ]]; then
    combine $DATACARD -n $OUTTAG -M Asymptotic -m 125.00 --cminDefaultMinimizerType=Minuit2 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so   --run=blind -t -1 --rRelAcc 0.001
else
    combine $DATACARD -n $OUTTAG -M Asymptotic -m 125.00 --cminDefaultMinimizerType=Minuit2 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so   --run=blind -t -1 --rRelAcc 0.001 -s 0
fi

return
#for node in `seq 0 -1`;
#for node in SM box `seq 0 11`;
for node in `seq 8 11`;
do
   DATACARD="Datacards/cms_HHbbgg_datacard_node${node}_${DATE}${SYSTEMATICS}.txt"
   OUTTAG="_node${node}_${DATE}${SYSTEMATICS}"
	if [[ "$SYSTEMATICS" == "_systematics" ]]; then
    	combine $DATACARD -n $OUTTAG -M Asymptotic -m 125.00 --cminDefaultMinimizerType=Minuit2 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so   --run=blind -t -1 --rRelAcc 0.001
	else
    	combine $DATACARD -n $OUTTAG -M Asymptotic -m 125.00 --cminDefaultMinimizerType=Minuit2 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so   --run=blind -t -1 --rRelAcc 0.001 -s 0
	fi
done


#combine -M HybridNew --testStat=LHC --frequentist  Datacards/cms_HHbbgg_datacard_nodeSM_06_05_2019_systematics.txt -T 100  --saveHybridResult --clsAcc 0 --singlePoint 0.8  --rMin 0.4 --rMax 1.6  -s -1 --fork 15
