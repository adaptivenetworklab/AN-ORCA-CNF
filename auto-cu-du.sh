#!/bin/bash

cd oai-gnb-cu-1/
helm upgrade oai-gnb-cu . --namespace oai
echo "cu-1 done, lanjut.."
sleep 2 

cd ..
cd oai-gnb-cu-2/
helm upgrade oai-gnb-cu-2 . --namespace oai
echo "cu-2 done, lanjut.."
sleep 2 

cd ..
cd oai-gnb-cu-3/
helm upgrade oai-gnb-cu-3 . --namespace oai
echo "cu-3 done, lanjut.."
sleep 2 

cd ..
cd oai-gnb-du-1/
helm upgrade oai-gnb-du . --namespace oai
echo "du-1 done, lanjut.."
sleep 2 

cd ..
cd oai-gnb-du-2/
helm upgrade oai-gnb-du-2 . --namespace oai
echo "du-2 done, lanjut.."
sleep 2 

cd ..
cd oai-gnb-du-3/
helm upgrade oai-gnb-du-3 . --namespace oai
echo "du-3 done, selesai :)"
sleep 2 

cd ..