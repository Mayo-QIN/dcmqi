# dcmqi

A grunt based implementation of ![QIICR/dcmqi](https://github.com/QIICR/dcmqi)

# Run Docker

```
docker pull mayoqin/dcmqi
docker run --rm -it -p 9901:9901 mayoqin/grunt\
```

Visit `localhost:9901`

# Interact with python

```
import sys
import os
from pygrunt import grunt
import uuid
import glob
subdir = str(uuid.uuid4())
# Create a folder for all the temporary stuff and remove at the end
directory='/tmp/'+subdir+'/'
if not os.path.exists(directory):
    os.makedirs(directory)
print ('I am saving temporary things in: %s'%(directory))
# Convert the DSO to nifti
print ('Example of response')
g = grunt("http://0.0.0.0:9901") % Please correct if you change the grunt port during lunch of the docker.
print (g.services)
j=g.segimage2itkimage
j.outputType='nifti'
j.prefix='volume'
j.outputDirName=''
j.inputSEGFileName='original.dcm' # DSO object
job =j()
# Commands can be executed synchronously or asynchronously
job.wait()
print ('Save')
job.downloadall(directory)
del j
```

> *pygrunt*
>
> https://github.com/Mayo-QIN/pygrunt
