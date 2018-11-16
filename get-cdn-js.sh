
urls=$(grep '<script' index.html | grep cdnjs | awk '{print $2}' | cut -d\" -f2)
cd 3rdparty
for u in $urls; do
  wget -nv $u
done 
