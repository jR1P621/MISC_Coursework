??
??
D
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
?
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 ":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
?
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*	2.5.0-rc12v2.5.0-rc0-36-g0d1805aede08??
?
conv2d_41/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *!
shared_nameconv2d_41/kernel
}
$conv2d_41/kernel/Read/ReadVariableOpReadVariableOpconv2d_41/kernel*&
_output_shapes
: *
dtype0
t
conv2d_41/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv2d_41/bias
m
"conv2d_41/bias/Read/ReadVariableOpReadVariableOpconv2d_41/bias*
_output_shapes
: *
dtype0
?
conv2d_42/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *!
shared_nameconv2d_42/kernel
}
$conv2d_42/kernel/Read/ReadVariableOpReadVariableOpconv2d_42/kernel*&
_output_shapes
:  *
dtype0
t
conv2d_42/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv2d_42/bias
m
"conv2d_42/bias/Read/ReadVariableOpReadVariableOpconv2d_42/bias*
_output_shapes
: *
dtype0
?
conv2d_43/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*!
shared_nameconv2d_43/kernel
}
$conv2d_43/kernel/Read/ReadVariableOpReadVariableOpconv2d_43/kernel*&
_output_shapes
: @*
dtype0
t
conv2d_43/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_nameconv2d_43/bias
m
"conv2d_43/bias/Read/ReadVariableOpReadVariableOpconv2d_43/bias*
_output_shapes
:@*
dtype0
|
dense_38/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??* 
shared_namedense_38/kernel
u
#dense_38/kernel/Read/ReadVariableOpReadVariableOpdense_38/kernel* 
_output_shapes
:
??*
dtype0
s
dense_38/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namedense_38/bias
l
!dense_38/bias/Read/ReadVariableOpReadVariableOpdense_38/bias*
_output_shapes	
:?*
dtype0
|
dense_39/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??* 
shared_namedense_39/kernel
u
#dense_39/kernel/Read/ReadVariableOpReadVariableOpdense_39/kernel* 
_output_shapes
:
??*
dtype0
s
dense_39/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namedense_39/bias
l
!dense_39/bias/Read/ReadVariableOpReadVariableOpdense_39/bias*
_output_shapes	
:?*
dtype0
{
dense_40/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?* 
shared_namedense_40/kernel
t
#dense_40/kernel/Read/ReadVariableOpReadVariableOpdense_40/kernel*
_output_shapes
:	?*
dtype0
r
dense_40/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_40/bias
k
!dense_40/bias/Read/ReadVariableOpReadVariableOpdense_40/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
?
Adam/conv2d_41/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_nameAdam/conv2d_41/kernel/m
?
+Adam/conv2d_41/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_41/kernel/m*&
_output_shapes
: *
dtype0
?
Adam/conv2d_41/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_nameAdam/conv2d_41/bias/m
{
)Adam/conv2d_41/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_41/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv2d_42/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *(
shared_nameAdam/conv2d_42/kernel/m
?
+Adam/conv2d_42/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_42/kernel/m*&
_output_shapes
:  *
dtype0
?
Adam/conv2d_42/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_nameAdam/conv2d_42/bias/m
{
)Adam/conv2d_42/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_42/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv2d_43/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*(
shared_nameAdam/conv2d_43/kernel/m
?
+Adam/conv2d_43/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_43/kernel/m*&
_output_shapes
: @*
dtype0
?
Adam/conv2d_43/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*&
shared_nameAdam/conv2d_43/bias/m
{
)Adam/conv2d_43/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d_43/bias/m*
_output_shapes
:@*
dtype0
?
Adam/dense_38/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*'
shared_nameAdam/dense_38/kernel/m
?
*Adam/dense_38/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_38/kernel/m* 
_output_shapes
:
??*
dtype0
?
Adam/dense_38/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*%
shared_nameAdam/dense_38/bias/m
z
(Adam/dense_38/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_38/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/dense_39/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*'
shared_nameAdam/dense_39/kernel/m
?
*Adam/dense_39/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_39/kernel/m* 
_output_shapes
:
??*
dtype0
?
Adam/dense_39/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*%
shared_nameAdam/dense_39/bias/m
z
(Adam/dense_39/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_39/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/dense_40/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*'
shared_nameAdam/dense_40/kernel/m
?
*Adam/dense_40/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_40/kernel/m*
_output_shapes
:	?*
dtype0
?
Adam/dense_40/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/dense_40/bias/m
y
(Adam/dense_40/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_40/bias/m*
_output_shapes
:*
dtype0
?
Adam/conv2d_41/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_nameAdam/conv2d_41/kernel/v
?
+Adam/conv2d_41/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_41/kernel/v*&
_output_shapes
: *
dtype0
?
Adam/conv2d_41/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_nameAdam/conv2d_41/bias/v
{
)Adam/conv2d_41/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_41/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv2d_42/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *(
shared_nameAdam/conv2d_42/kernel/v
?
+Adam/conv2d_42/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_42/kernel/v*&
_output_shapes
:  *
dtype0
?
Adam/conv2d_42/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_nameAdam/conv2d_42/bias/v
{
)Adam/conv2d_42/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_42/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv2d_43/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*(
shared_nameAdam/conv2d_43/kernel/v
?
+Adam/conv2d_43/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_43/kernel/v*&
_output_shapes
: @*
dtype0
?
Adam/conv2d_43/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*&
shared_nameAdam/conv2d_43/bias/v
{
)Adam/conv2d_43/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d_43/bias/v*
_output_shapes
:@*
dtype0
?
Adam/dense_38/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*'
shared_nameAdam/dense_38/kernel/v
?
*Adam/dense_38/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_38/kernel/v* 
_output_shapes
:
??*
dtype0
?
Adam/dense_38/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*%
shared_nameAdam/dense_38/bias/v
z
(Adam/dense_38/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_38/bias/v*
_output_shapes	
:?*
dtype0
?
Adam/dense_39/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*'
shared_nameAdam/dense_39/kernel/v
?
*Adam/dense_39/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_39/kernel/v* 
_output_shapes
:
??*
dtype0
?
Adam/dense_39/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*%
shared_nameAdam/dense_39/bias/v
z
(Adam/dense_39/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_39/bias/v*
_output_shapes	
:?*
dtype0
?
Adam/dense_40/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*'
shared_nameAdam/dense_40/kernel/v
?
*Adam/dense_40/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_40/kernel/v*
_output_shapes
:	?*
dtype0
?
Adam/dense_40/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/dense_40/bias/v
y
(Adam/dense_40/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_40/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
?P
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?P
value?PB?P B?P
?
layer-0
layer_with_weights-0
layer-1
layer-2
layer-3
layer_with_weights-1
layer-4
layer-5
layer-6
layer_with_weights-2
layer-7
	layer-8

layer-9
layer-10
layer_with_weights-3
layer-11
layer_with_weights-4
layer-12
layer_with_weights-5
layer-13
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api

signatures

	keras_api
h

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
R
	variables
trainable_variables
regularization_losses
	keras_api
R
 	variables
!trainable_variables
"regularization_losses
#	keras_api
h

$kernel
%bias
&	variables
'trainable_variables
(regularization_losses
)	keras_api
R
*	variables
+trainable_variables
,regularization_losses
-	keras_api
R
.	variables
/trainable_variables
0regularization_losses
1	keras_api
h

2kernel
3bias
4	variables
5trainable_variables
6regularization_losses
7	keras_api
R
8	variables
9trainable_variables
:regularization_losses
;	keras_api
R
<	variables
=trainable_variables
>regularization_losses
?	keras_api
R
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
h

Dkernel
Ebias
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
h

Jkernel
Kbias
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
h

Pkernel
Qbias
R	variables
Strainable_variables
Tregularization_losses
U	keras_api
?
Viter

Wbeta_1

Xbeta_2
	Ydecay
Zlearning_ratem?m?$m?%m?2m?3m?Dm?Em?Jm?Km?Pm?Qm?v?v?$v?%v?2v?3v?Dv?Ev?Jv?Kv?Pv?Qv?
V
0
1
$2
%3
24
35
D6
E7
J8
K9
P10
Q11
V
0
1
$2
%3
24
35
D6
E7
J8
K9
P10
Q11
 
?
	variables
[layer_regularization_losses
\metrics
]layer_metrics

^layers
_non_trainable_variables
trainable_variables
regularization_losses
 
 
\Z
VARIABLE_VALUEconv2d_41/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
XV
VARIABLE_VALUEconv2d_41/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
	variables
`layer_regularization_losses
ametrics
blayer_metrics

clayers
dnon_trainable_variables
trainable_variables
regularization_losses
 
 
 
?
	variables
elayer_regularization_losses
fmetrics
glayer_metrics

hlayers
inon_trainable_variables
trainable_variables
regularization_losses
 
 
 
?
 	variables
jlayer_regularization_losses
kmetrics
llayer_metrics

mlayers
nnon_trainable_variables
!trainable_variables
"regularization_losses
\Z
VARIABLE_VALUEconv2d_42/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
XV
VARIABLE_VALUEconv2d_42/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

$0
%1

$0
%1
 
?
&	variables
olayer_regularization_losses
pmetrics
qlayer_metrics

rlayers
snon_trainable_variables
'trainable_variables
(regularization_losses
 
 
 
?
*	variables
tlayer_regularization_losses
umetrics
vlayer_metrics

wlayers
xnon_trainable_variables
+trainable_variables
,regularization_losses
 
 
 
?
.	variables
ylayer_regularization_losses
zmetrics
{layer_metrics

|layers
}non_trainable_variables
/trainable_variables
0regularization_losses
\Z
VARIABLE_VALUEconv2d_43/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
XV
VARIABLE_VALUEconv2d_43/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

20
31

20
31
 
?
4	variables
~layer_regularization_losses
metrics
?layer_metrics
?layers
?non_trainable_variables
5trainable_variables
6regularization_losses
 
 
 
?
8	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
9trainable_variables
:regularization_losses
 
 
 
?
<	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
=trainable_variables
>regularization_losses
 
 
 
?
@	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Atrainable_variables
Bregularization_losses
[Y
VARIABLE_VALUEdense_38/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEdense_38/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

D0
E1

D0
E1
 
?
F	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Gtrainable_variables
Hregularization_losses
[Y
VARIABLE_VALUEdense_39/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEdense_39/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE

J0
K1

J0
K1
 
?
L	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Mtrainable_variables
Nregularization_losses
[Y
VARIABLE_VALUEdense_40/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEdense_40/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE

P0
Q1

P0
Q1
 
?
R	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Strainable_variables
Tregularization_losses
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
 

?0
?1
 
f
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
8

?total

?count
?	variables
?	keras_api
I

?total

?count
?
_fn_kwargs
?	variables
?	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

?0
?1

?	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

?0
?1

?	variables
}
VARIABLE_VALUEAdam/conv2d_41/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/conv2d_41/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/conv2d_42/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/conv2d_42/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/conv2d_43/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/conv2d_43/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_38/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/dense_38/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_39/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/dense_39/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_40/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/dense_40/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/conv2d_41/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/conv2d_41/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/conv2d_42/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/conv2d_42/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/conv2d_43/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/conv2d_43/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_38/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/dense_38/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_39/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/dense_39/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_40/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/dense_40/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
?
"serving_default_rescaling_19_inputPlaceholder*1
_output_shapes
:???????????*
dtype0*&
shape:???????????
?
StatefulPartitionedCallStatefulPartitionedCall"serving_default_rescaling_19_inputconv2d_41/kernelconv2d_41/biasconv2d_42/kernelconv2d_42/biasconv2d_43/kernelconv2d_43/biasdense_38/kerneldense_38/biasdense_39/kerneldense_39/biasdense_40/kerneldense_40/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *-
f(R&
$__inference_signature_wrapper_873873
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename$conv2d_41/kernel/Read/ReadVariableOp"conv2d_41/bias/Read/ReadVariableOp$conv2d_42/kernel/Read/ReadVariableOp"conv2d_42/bias/Read/ReadVariableOp$conv2d_43/kernel/Read/ReadVariableOp"conv2d_43/bias/Read/ReadVariableOp#dense_38/kernel/Read/ReadVariableOp!dense_38/bias/Read/ReadVariableOp#dense_39/kernel/Read/ReadVariableOp!dense_39/bias/Read/ReadVariableOp#dense_40/kernel/Read/ReadVariableOp!dense_40/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp+Adam/conv2d_41/kernel/m/Read/ReadVariableOp)Adam/conv2d_41/bias/m/Read/ReadVariableOp+Adam/conv2d_42/kernel/m/Read/ReadVariableOp)Adam/conv2d_42/bias/m/Read/ReadVariableOp+Adam/conv2d_43/kernel/m/Read/ReadVariableOp)Adam/conv2d_43/bias/m/Read/ReadVariableOp*Adam/dense_38/kernel/m/Read/ReadVariableOp(Adam/dense_38/bias/m/Read/ReadVariableOp*Adam/dense_39/kernel/m/Read/ReadVariableOp(Adam/dense_39/bias/m/Read/ReadVariableOp*Adam/dense_40/kernel/m/Read/ReadVariableOp(Adam/dense_40/bias/m/Read/ReadVariableOp+Adam/conv2d_41/kernel/v/Read/ReadVariableOp)Adam/conv2d_41/bias/v/Read/ReadVariableOp+Adam/conv2d_42/kernel/v/Read/ReadVariableOp)Adam/conv2d_42/bias/v/Read/ReadVariableOp+Adam/conv2d_43/kernel/v/Read/ReadVariableOp)Adam/conv2d_43/bias/v/Read/ReadVariableOp*Adam/dense_38/kernel/v/Read/ReadVariableOp(Adam/dense_38/bias/v/Read/ReadVariableOp*Adam/dense_39/kernel/v/Read/ReadVariableOp(Adam/dense_39/bias/v/Read/ReadVariableOp*Adam/dense_40/kernel/v/Read/ReadVariableOp(Adam/dense_40/bias/v/Read/ReadVariableOpConst*:
Tin3
12/	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *(
f#R!
__inference__traced_save_874438
?	
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv2d_41/kernelconv2d_41/biasconv2d_42/kernelconv2d_42/biasconv2d_43/kernelconv2d_43/biasdense_38/kerneldense_38/biasdense_39/kerneldense_39/biasdense_40/kerneldense_40/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/conv2d_41/kernel/mAdam/conv2d_41/bias/mAdam/conv2d_42/kernel/mAdam/conv2d_42/bias/mAdam/conv2d_43/kernel/mAdam/conv2d_43/bias/mAdam/dense_38/kernel/mAdam/dense_38/bias/mAdam/dense_39/kernel/mAdam/dense_39/bias/mAdam/dense_40/kernel/mAdam/dense_40/bias/mAdam/conv2d_41/kernel/vAdam/conv2d_41/bias/vAdam/conv2d_42/kernel/vAdam/conv2d_42/bias/vAdam/conv2d_43/kernel/vAdam/conv2d_43/bias/vAdam/dense_38/kernel/vAdam/dense_38/bias/vAdam/dense_39/kernel/vAdam/dense_39/bias/vAdam/dense_40/kernel/vAdam/dense_40/bias/v*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *+
f&R$
"__inference__traced_restore_874583??	
?
G
+__inference_dropout_27_layer_call_fn_874204

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_27_layer_call_and_return_conditional_losses_8733902
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:?????????@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?

?
D__inference_dense_38_layer_call_and_return_conditional_losses_873411

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:??????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
*__inference_conv2d_43_layer_call_fn_874182

inputs!
unknown: @
	unknown_0:@
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????		@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_43_layer_call_and_return_conditional_losses_8733782
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:?????????		@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
d
+__inference_dropout_26_layer_call_fn_874162

inputs
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_26_layer_call_and_return_conditional_losses_8735682
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
d
F__inference_dropout_25_layer_call_and_return_conditional_losses_873340

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:?????????%% 2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:?????????%% 2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????%% :W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?

?
D__inference_dense_40_layer_call_and_return_conditional_losses_873445

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:?????????2	
Softmax?
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
e
F__inference_dropout_27_layer_call_and_return_conditional_losses_874199

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:?????????@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:?????????@*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:?????????@2
dropout/GreaterEqual?
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:?????????@2
dropout/Cast?
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:?????????@2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:?????????@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
E__inference_conv2d_41_layer_call_and_return_conditional_losses_873328

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?Conv2D/ReadVariableOp?
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype02
Conv2D/ReadVariableOp?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? *
paddingSAME*
strides
2
Conv2D?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? 2	
BiasAddb
ReluReluBiasAdd:output:0*
T0*1
_output_shapes
:??????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*1
_output_shapes
:??????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:???????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?<
?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873452

inputs*
conv2d_41_873329: 
conv2d_41_873331: *
conv2d_42_873354:  
conv2d_42_873356: *
conv2d_43_873379: @
conv2d_43_873381:@#
dense_38_873412:
??
dense_38_873414:	?#
dense_39_873429:
??
dense_39_873431:	?"
dense_40_873446:	?
dense_40_873448:
identity??!conv2d_41/StatefulPartitionedCall?!conv2d_42/StatefulPartitionedCall?!conv2d_43/StatefulPartitionedCall? dense_38/StatefulPartitionedCall? dense_39/StatefulPartitionedCall? dense_40/StatefulPartitionedCallo
rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2
rescaling_19/Cast/xs
rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rescaling_19/Cast_1/x?
rescaling_19/mulMulinputsrescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/mul?
rescaling_19/addAddV2rescaling_19/mul:z:0rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/add?
!conv2d_41/StatefulPartitionedCallStatefulPartitionedCallrescaling_19/add:z:0conv2d_41_873329conv2d_41_873331*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:??????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_41_layer_call_and_return_conditional_losses_8733282#
!conv2d_41/StatefulPartitionedCall?
 max_pooling2d_41/PartitionedCallPartitionedCall*conv2d_41/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_8732762"
 max_pooling2d_41/PartitionedCall?
dropout_25/PartitionedCallPartitionedCall)max_pooling2d_41/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_25_layer_call_and_return_conditional_losses_8733402
dropout_25/PartitionedCall?
!conv2d_42/StatefulPartitionedCallStatefulPartitionedCall#dropout_25/PartitionedCall:output:0conv2d_42_873354conv2d_42_873356*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????## *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_42_layer_call_and_return_conditional_losses_8733532#
!conv2d_42/StatefulPartitionedCall?
 max_pooling2d_42/PartitionedCallPartitionedCall*conv2d_42/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_8732882"
 max_pooling2d_42/PartitionedCall?
dropout_26/PartitionedCallPartitionedCall)max_pooling2d_42/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_26_layer_call_and_return_conditional_losses_8733652
dropout_26/PartitionedCall?
!conv2d_43/StatefulPartitionedCallStatefulPartitionedCall#dropout_26/PartitionedCall:output:0conv2d_43_873379conv2d_43_873381*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????		@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_43_layer_call_and_return_conditional_losses_8733782#
!conv2d_43/StatefulPartitionedCall?
 max_pooling2d_43/PartitionedCallPartitionedCall*conv2d_43/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_8733002"
 max_pooling2d_43/PartitionedCall?
dropout_27/PartitionedCallPartitionedCall)max_pooling2d_43/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_27_layer_call_and_return_conditional_losses_8733902
dropout_27/PartitionedCall?
flatten_19/PartitionedCallPartitionedCall#dropout_27/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_flatten_19_layer_call_and_return_conditional_losses_8733982
flatten_19/PartitionedCall?
 dense_38/StatefulPartitionedCallStatefulPartitionedCall#flatten_19/PartitionedCall:output:0dense_38_873412dense_38_873414*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_38_layer_call_and_return_conditional_losses_8734112"
 dense_38/StatefulPartitionedCall?
 dense_39/StatefulPartitionedCallStatefulPartitionedCall)dense_38/StatefulPartitionedCall:output:0dense_39_873429dense_39_873431*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_39_layer_call_and_return_conditional_losses_8734282"
 dense_39/StatefulPartitionedCall?
 dense_40/StatefulPartitionedCallStatefulPartitionedCall)dense_39/StatefulPartitionedCall:output:0dense_40_873446dense_40_873448*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_40_layer_call_and_return_conditional_losses_8734452"
 dense_40/StatefulPartitionedCall?
IdentityIdentity)dense_40/StatefulPartitionedCall:output:0"^conv2d_41/StatefulPartitionedCall"^conv2d_42/StatefulPartitionedCall"^conv2d_43/StatefulPartitionedCall!^dense_38/StatefulPartitionedCall!^dense_39/StatefulPartitionedCall!^dense_40/StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2F
!conv2d_41/StatefulPartitionedCall!conv2d_41/StatefulPartitionedCall2F
!conv2d_42/StatefulPartitionedCall!conv2d_42/StatefulPartitionedCall2F
!conv2d_43/StatefulPartitionedCall!conv2d_43/StatefulPartitionedCall2D
 dense_38/StatefulPartitionedCall dense_38/StatefulPartitionedCall2D
 dense_39/StatefulPartitionedCall dense_39/StatefulPartitionedCall2D
 dense_40/StatefulPartitionedCall dense_40/StatefulPartitionedCall:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?

?
D__inference_dense_39_layer_call_and_return_conditional_losses_873428

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:??????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?

?
.__inference_sequential_19_layer_call_fn_874068

inputs!
unknown: 
	unknown_0: #
	unknown_1:  
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *R
fMRK
I__inference_sequential_19_layer_call_and_return_conditional_losses_8736902
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?
?
)__inference_dense_38_layer_call_fn_874240

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_38_layer_call_and_return_conditional_losses_8734112
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
E__inference_conv2d_43_layer_call_and_return_conditional_losses_873378

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity??BiasAdd/ReadVariableOp?Conv2D/ReadVariableOp?
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02
Conv2D/ReadVariableOp?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@*
paddingVALID*
strides
2
Conv2D?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:?????????		@2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:?????????		@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
??
?
"__inference__traced_restore_874583
file_prefix;
!assignvariableop_conv2d_41_kernel: /
!assignvariableop_1_conv2d_41_bias: =
#assignvariableop_2_conv2d_42_kernel:  /
!assignvariableop_3_conv2d_42_bias: =
#assignvariableop_4_conv2d_43_kernel: @/
!assignvariableop_5_conv2d_43_bias:@6
"assignvariableop_6_dense_38_kernel:
??/
 assignvariableop_7_dense_38_bias:	?6
"assignvariableop_8_dense_39_kernel:
??/
 assignvariableop_9_dense_39_bias:	?6
#assignvariableop_10_dense_40_kernel:	?/
!assignvariableop_11_dense_40_bias:'
assignvariableop_12_adam_iter:	 )
assignvariableop_13_adam_beta_1: )
assignvariableop_14_adam_beta_2: (
assignvariableop_15_adam_decay: 0
&assignvariableop_16_adam_learning_rate: #
assignvariableop_17_total: #
assignvariableop_18_count: %
assignvariableop_19_total_1: %
assignvariableop_20_count_1: E
+assignvariableop_21_adam_conv2d_41_kernel_m: 7
)assignvariableop_22_adam_conv2d_41_bias_m: E
+assignvariableop_23_adam_conv2d_42_kernel_m:  7
)assignvariableop_24_adam_conv2d_42_bias_m: E
+assignvariableop_25_adam_conv2d_43_kernel_m: @7
)assignvariableop_26_adam_conv2d_43_bias_m:@>
*assignvariableop_27_adam_dense_38_kernel_m:
??7
(assignvariableop_28_adam_dense_38_bias_m:	?>
*assignvariableop_29_adam_dense_39_kernel_m:
??7
(assignvariableop_30_adam_dense_39_bias_m:	?=
*assignvariableop_31_adam_dense_40_kernel_m:	?6
(assignvariableop_32_adam_dense_40_bias_m:E
+assignvariableop_33_adam_conv2d_41_kernel_v: 7
)assignvariableop_34_adam_conv2d_41_bias_v: E
+assignvariableop_35_adam_conv2d_42_kernel_v:  7
)assignvariableop_36_adam_conv2d_42_bias_v: E
+assignvariableop_37_adam_conv2d_43_kernel_v: @7
)assignvariableop_38_adam_conv2d_43_bias_v:@>
*assignvariableop_39_adam_dense_38_kernel_v:
??7
(assignvariableop_40_adam_dense_38_bias_v:	?>
*assignvariableop_41_adam_dense_39_kernel_v:
??7
(assignvariableop_42_adam_dense_39_bias_v:	?=
*assignvariableop_43_adam_dense_40_kernel_v:	?6
(assignvariableop_44_adam_dense_40_bias_v:
identity_46??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_25?AssignVariableOp_26?AssignVariableOp_27?AssignVariableOp_28?AssignVariableOp_29?AssignVariableOp_3?AssignVariableOp_30?AssignVariableOp_31?AssignVariableOp_32?AssignVariableOp_33?AssignVariableOp_34?AssignVariableOp_35?AssignVariableOp_36?AssignVariableOp_37?AssignVariableOp_38?AssignVariableOp_39?AssignVariableOp_4?AssignVariableOp_40?AssignVariableOp_41?AssignVariableOp_42?AssignVariableOp_43?AssignVariableOp_44?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*?
value?B?.B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*?
_output_shapes?
?::::::::::::::::::::::::::::::::::::::::::::::*<
dtypes2
02.	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOp!assignvariableop_conv2d_41_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOp!assignvariableop_1_conv2d_41_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp#assignvariableop_2_conv2d_42_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOp!assignvariableop_3_conv2d_42_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOp#assignvariableop_4_conv2d_43_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOp!assignvariableop_5_conv2d_43_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOp"assignvariableop_6_dense_38_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOp assignvariableop_7_dense_38_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOp"assignvariableop_8_dense_39_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp assignvariableop_9_dense_39_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp#assignvariableop_10_dense_40_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOp!assignvariableop_11_dense_40_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0	*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_iterIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOpassignvariableop_13_adam_beta_1Identity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOpassignvariableop_14_adam_beta_2Identity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOpassignvariableop_15_adam_decayIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_learning_rateIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOpassignvariableop_17_totalIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOpassignvariableop_18_countIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOpassignvariableop_19_total_1Identity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOpassignvariableop_20_count_1Identity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21?
AssignVariableOp_21AssignVariableOp+assignvariableop_21_adam_conv2d_41_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22?
AssignVariableOp_22AssignVariableOp)assignvariableop_22_adam_conv2d_41_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23?
AssignVariableOp_23AssignVariableOp+assignvariableop_23_adam_conv2d_42_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24?
AssignVariableOp_24AssignVariableOp)assignvariableop_24_adam_conv2d_42_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25?
AssignVariableOp_25AssignVariableOp+assignvariableop_25_adam_conv2d_43_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26?
AssignVariableOp_26AssignVariableOp)assignvariableop_26_adam_conv2d_43_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27?
AssignVariableOp_27AssignVariableOp*assignvariableop_27_adam_dense_38_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28?
AssignVariableOp_28AssignVariableOp(assignvariableop_28_adam_dense_38_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29?
AssignVariableOp_29AssignVariableOp*assignvariableop_29_adam_dense_39_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30?
AssignVariableOp_30AssignVariableOp(assignvariableop_30_adam_dense_39_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31?
AssignVariableOp_31AssignVariableOp*assignvariableop_31_adam_dense_40_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32?
AssignVariableOp_32AssignVariableOp(assignvariableop_32_adam_dense_40_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33?
AssignVariableOp_33AssignVariableOp+assignvariableop_33_adam_conv2d_41_kernel_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34?
AssignVariableOp_34AssignVariableOp)assignvariableop_34_adam_conv2d_41_bias_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35?
AssignVariableOp_35AssignVariableOp+assignvariableop_35_adam_conv2d_42_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36?
AssignVariableOp_36AssignVariableOp)assignvariableop_36_adam_conv2d_42_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37?
AssignVariableOp_37AssignVariableOp+assignvariableop_37_adam_conv2d_43_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38?
AssignVariableOp_38AssignVariableOp)assignvariableop_38_adam_conv2d_43_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_38n
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:2
Identity_39?
AssignVariableOp_39AssignVariableOp*assignvariableop_39_adam_dense_38_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39n
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:2
Identity_40?
AssignVariableOp_40AssignVariableOp(assignvariableop_40_adam_dense_38_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_40n
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:2
Identity_41?
AssignVariableOp_41AssignVariableOp*assignvariableop_41_adam_dense_39_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_41n
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:2
Identity_42?
AssignVariableOp_42AssignVariableOp(assignvariableop_42_adam_dense_39_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_42n
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:2
Identity_43?
AssignVariableOp_43AssignVariableOp*assignvariableop_43_adam_dense_40_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_43n
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:2
Identity_44?
AssignVariableOp_44AssignVariableOp(assignvariableop_44_adam_dense_40_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_449
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_45Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_45?
Identity_46IdentityIdentity_45:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_46"#
identity_46Identity_46:output:0*o
_input_shapes^
\: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?a
?
!__inference__wrapped_model_873270
rescaling_19_inputP
6sequential_19_conv2d_41_conv2d_readvariableop_resource: E
7sequential_19_conv2d_41_biasadd_readvariableop_resource: P
6sequential_19_conv2d_42_conv2d_readvariableop_resource:  E
7sequential_19_conv2d_42_biasadd_readvariableop_resource: P
6sequential_19_conv2d_43_conv2d_readvariableop_resource: @E
7sequential_19_conv2d_43_biasadd_readvariableop_resource:@I
5sequential_19_dense_38_matmul_readvariableop_resource:
??E
6sequential_19_dense_38_biasadd_readvariableop_resource:	?I
5sequential_19_dense_39_matmul_readvariableop_resource:
??E
6sequential_19_dense_39_biasadd_readvariableop_resource:	?H
5sequential_19_dense_40_matmul_readvariableop_resource:	?D
6sequential_19_dense_40_biasadd_readvariableop_resource:
identity??.sequential_19/conv2d_41/BiasAdd/ReadVariableOp?-sequential_19/conv2d_41/Conv2D/ReadVariableOp?.sequential_19/conv2d_42/BiasAdd/ReadVariableOp?-sequential_19/conv2d_42/Conv2D/ReadVariableOp?.sequential_19/conv2d_43/BiasAdd/ReadVariableOp?-sequential_19/conv2d_43/Conv2D/ReadVariableOp?-sequential_19/dense_38/BiasAdd/ReadVariableOp?,sequential_19/dense_38/MatMul/ReadVariableOp?-sequential_19/dense_39/BiasAdd/ReadVariableOp?,sequential_19/dense_39/MatMul/ReadVariableOp?-sequential_19/dense_40/BiasAdd/ReadVariableOp?,sequential_19/dense_40/MatMul/ReadVariableOp?
!sequential_19/rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2#
!sequential_19/rescaling_19/Cast/x?
#sequential_19/rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#sequential_19/rescaling_19/Cast_1/x?
sequential_19/rescaling_19/mulMulrescaling_19_input*sequential_19/rescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2 
sequential_19/rescaling_19/mul?
sequential_19/rescaling_19/addAddV2"sequential_19/rescaling_19/mul:z:0,sequential_19/rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2 
sequential_19/rescaling_19/add?
-sequential_19/conv2d_41/Conv2D/ReadVariableOpReadVariableOp6sequential_19_conv2d_41_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype02/
-sequential_19/conv2d_41/Conv2D/ReadVariableOp?
sequential_19/conv2d_41/Conv2DConv2D"sequential_19/rescaling_19/add:z:05sequential_19/conv2d_41/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? *
paddingSAME*
strides
2 
sequential_19/conv2d_41/Conv2D?
.sequential_19/conv2d_41/BiasAdd/ReadVariableOpReadVariableOp7sequential_19_conv2d_41_biasadd_readvariableop_resource*
_output_shapes
: *
dtype020
.sequential_19/conv2d_41/BiasAdd/ReadVariableOp?
sequential_19/conv2d_41/BiasAddBiasAdd'sequential_19/conv2d_41/Conv2D:output:06sequential_19/conv2d_41/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? 2!
sequential_19/conv2d_41/BiasAdd?
sequential_19/conv2d_41/ReluRelu(sequential_19/conv2d_41/BiasAdd:output:0*
T0*1
_output_shapes
:??????????? 2
sequential_19/conv2d_41/Relu?
&sequential_19/max_pooling2d_41/MaxPoolMaxPool*sequential_19/conv2d_41/Relu:activations:0*/
_output_shapes
:?????????%% *
ksize
*
paddingVALID*
strides
2(
&sequential_19/max_pooling2d_41/MaxPool?
!sequential_19/dropout_25/IdentityIdentity/sequential_19/max_pooling2d_41/MaxPool:output:0*
T0*/
_output_shapes
:?????????%% 2#
!sequential_19/dropout_25/Identity?
-sequential_19/conv2d_42/Conv2D/ReadVariableOpReadVariableOp6sequential_19_conv2d_42_conv2d_readvariableop_resource*&
_output_shapes
:  *
dtype02/
-sequential_19/conv2d_42/Conv2D/ReadVariableOp?
sequential_19/conv2d_42/Conv2DConv2D*sequential_19/dropout_25/Identity:output:05sequential_19/conv2d_42/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## *
paddingVALID*
strides
2 
sequential_19/conv2d_42/Conv2D?
.sequential_19/conv2d_42/BiasAdd/ReadVariableOpReadVariableOp7sequential_19_conv2d_42_biasadd_readvariableop_resource*
_output_shapes
: *
dtype020
.sequential_19/conv2d_42/BiasAdd/ReadVariableOp?
sequential_19/conv2d_42/BiasAddBiasAdd'sequential_19/conv2d_42/Conv2D:output:06sequential_19/conv2d_42/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## 2!
sequential_19/conv2d_42/BiasAdd?
sequential_19/conv2d_42/ReluRelu(sequential_19/conv2d_42/BiasAdd:output:0*
T0*/
_output_shapes
:?????????## 2
sequential_19/conv2d_42/Relu?
&sequential_19/max_pooling2d_42/MaxPoolMaxPool*sequential_19/conv2d_42/Relu:activations:0*/
_output_shapes
:????????? *
ksize
*
paddingVALID*
strides
2(
&sequential_19/max_pooling2d_42/MaxPool?
!sequential_19/dropout_26/IdentityIdentity/sequential_19/max_pooling2d_42/MaxPool:output:0*
T0*/
_output_shapes
:????????? 2#
!sequential_19/dropout_26/Identity?
-sequential_19/conv2d_43/Conv2D/ReadVariableOpReadVariableOp6sequential_19_conv2d_43_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02/
-sequential_19/conv2d_43/Conv2D/ReadVariableOp?
sequential_19/conv2d_43/Conv2DConv2D*sequential_19/dropout_26/Identity:output:05sequential_19/conv2d_43/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@*
paddingVALID*
strides
2 
sequential_19/conv2d_43/Conv2D?
.sequential_19/conv2d_43/BiasAdd/ReadVariableOpReadVariableOp7sequential_19_conv2d_43_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype020
.sequential_19/conv2d_43/BiasAdd/ReadVariableOp?
sequential_19/conv2d_43/BiasAddBiasAdd'sequential_19/conv2d_43/Conv2D:output:06sequential_19/conv2d_43/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@2!
sequential_19/conv2d_43/BiasAdd?
sequential_19/conv2d_43/ReluRelu(sequential_19/conv2d_43/BiasAdd:output:0*
T0*/
_output_shapes
:?????????		@2
sequential_19/conv2d_43/Relu?
&sequential_19/max_pooling2d_43/MaxPoolMaxPool*sequential_19/conv2d_43/Relu:activations:0*/
_output_shapes
:?????????@*
ksize
*
paddingVALID*
strides
2(
&sequential_19/max_pooling2d_43/MaxPool?
!sequential_19/dropout_27/IdentityIdentity/sequential_19/max_pooling2d_43/MaxPool:output:0*
T0*/
_output_shapes
:?????????@2#
!sequential_19/dropout_27/Identity?
sequential_19/flatten_19/ConstConst*
_output_shapes
:*
dtype0*
valueB"????   2 
sequential_19/flatten_19/Const?
 sequential_19/flatten_19/ReshapeReshape*sequential_19/dropout_27/Identity:output:0'sequential_19/flatten_19/Const:output:0*
T0*(
_output_shapes
:??????????2"
 sequential_19/flatten_19/Reshape?
,sequential_19/dense_38/MatMul/ReadVariableOpReadVariableOp5sequential_19_dense_38_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02.
,sequential_19/dense_38/MatMul/ReadVariableOp?
sequential_19/dense_38/MatMulMatMul)sequential_19/flatten_19/Reshape:output:04sequential_19/dense_38/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
sequential_19/dense_38/MatMul?
-sequential_19/dense_38/BiasAdd/ReadVariableOpReadVariableOp6sequential_19_dense_38_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02/
-sequential_19/dense_38/BiasAdd/ReadVariableOp?
sequential_19/dense_38/BiasAddBiasAdd'sequential_19/dense_38/MatMul:product:05sequential_19/dense_38/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2 
sequential_19/dense_38/BiasAdd?
sequential_19/dense_38/ReluRelu'sequential_19/dense_38/BiasAdd:output:0*
T0*(
_output_shapes
:??????????2
sequential_19/dense_38/Relu?
,sequential_19/dense_39/MatMul/ReadVariableOpReadVariableOp5sequential_19_dense_39_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02.
,sequential_19/dense_39/MatMul/ReadVariableOp?
sequential_19/dense_39/MatMulMatMul)sequential_19/dense_38/Relu:activations:04sequential_19/dense_39/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
sequential_19/dense_39/MatMul?
-sequential_19/dense_39/BiasAdd/ReadVariableOpReadVariableOp6sequential_19_dense_39_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02/
-sequential_19/dense_39/BiasAdd/ReadVariableOp?
sequential_19/dense_39/BiasAddBiasAdd'sequential_19/dense_39/MatMul:product:05sequential_19/dense_39/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2 
sequential_19/dense_39/BiasAdd?
sequential_19/dense_39/ReluRelu'sequential_19/dense_39/BiasAdd:output:0*
T0*(
_output_shapes
:??????????2
sequential_19/dense_39/Relu?
,sequential_19/dense_40/MatMul/ReadVariableOpReadVariableOp5sequential_19_dense_40_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype02.
,sequential_19/dense_40/MatMul/ReadVariableOp?
sequential_19/dense_40/MatMulMatMul)sequential_19/dense_39/Relu:activations:04sequential_19/dense_40/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
sequential_19/dense_40/MatMul?
-sequential_19/dense_40/BiasAdd/ReadVariableOpReadVariableOp6sequential_19_dense_40_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-sequential_19/dense_40/BiasAdd/ReadVariableOp?
sequential_19/dense_40/BiasAddBiasAdd'sequential_19/dense_40/MatMul:product:05sequential_19/dense_40/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2 
sequential_19/dense_40/BiasAdd?
sequential_19/dense_40/SoftmaxSoftmax'sequential_19/dense_40/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2 
sequential_19/dense_40/Softmax?
IdentityIdentity(sequential_19/dense_40/Softmax:softmax:0/^sequential_19/conv2d_41/BiasAdd/ReadVariableOp.^sequential_19/conv2d_41/Conv2D/ReadVariableOp/^sequential_19/conv2d_42/BiasAdd/ReadVariableOp.^sequential_19/conv2d_42/Conv2D/ReadVariableOp/^sequential_19/conv2d_43/BiasAdd/ReadVariableOp.^sequential_19/conv2d_43/Conv2D/ReadVariableOp.^sequential_19/dense_38/BiasAdd/ReadVariableOp-^sequential_19/dense_38/MatMul/ReadVariableOp.^sequential_19/dense_39/BiasAdd/ReadVariableOp-^sequential_19/dense_39/MatMul/ReadVariableOp.^sequential_19/dense_40/BiasAdd/ReadVariableOp-^sequential_19/dense_40/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2`
.sequential_19/conv2d_41/BiasAdd/ReadVariableOp.sequential_19/conv2d_41/BiasAdd/ReadVariableOp2^
-sequential_19/conv2d_41/Conv2D/ReadVariableOp-sequential_19/conv2d_41/Conv2D/ReadVariableOp2`
.sequential_19/conv2d_42/BiasAdd/ReadVariableOp.sequential_19/conv2d_42/BiasAdd/ReadVariableOp2^
-sequential_19/conv2d_42/Conv2D/ReadVariableOp-sequential_19/conv2d_42/Conv2D/ReadVariableOp2`
.sequential_19/conv2d_43/BiasAdd/ReadVariableOp.sequential_19/conv2d_43/BiasAdd/ReadVariableOp2^
-sequential_19/conv2d_43/Conv2D/ReadVariableOp-sequential_19/conv2d_43/Conv2D/ReadVariableOp2^
-sequential_19/dense_38/BiasAdd/ReadVariableOp-sequential_19/dense_38/BiasAdd/ReadVariableOp2\
,sequential_19/dense_38/MatMul/ReadVariableOp,sequential_19/dense_38/MatMul/ReadVariableOp2^
-sequential_19/dense_39/BiasAdd/ReadVariableOp-sequential_19/dense_39/BiasAdd/ReadVariableOp2\
,sequential_19/dense_39/MatMul/ReadVariableOp,sequential_19/dense_39/MatMul/ReadVariableOp2^
-sequential_19/dense_40/BiasAdd/ReadVariableOp-sequential_19/dense_40/BiasAdd/ReadVariableOp2\
,sequential_19/dense_40/MatMul/ReadVariableOp,sequential_19/dense_40/MatMul/ReadVariableOp:e a
1
_output_shapes
:???????????
,
_user_specified_namerescaling_19_input
?
G
+__inference_flatten_19_layer_call_fn_874220

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_flatten_19_layer_call_and_return_conditional_losses_8733982
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
e
F__inference_dropout_27_layer_call_and_return_conditional_losses_873535

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:?????????@2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:?????????@*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:?????????@2
dropout/GreaterEqual?
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:?????????@2
dropout/Cast?
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:?????????@2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:?????????@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
)__inference_dense_39_layer_call_fn_874260

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_39_layer_call_and_return_conditional_losses_8734282
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
d
F__inference_dropout_26_layer_call_and_return_conditional_losses_874140

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:????????? 2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:????????? 2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? :W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?A
?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873836
rescaling_19_input*
conv2d_41_873798: 
conv2d_41_873800: *
conv2d_42_873805:  
conv2d_42_873807: *
conv2d_43_873812: @
conv2d_43_873814:@#
dense_38_873820:
??
dense_38_873822:	?#
dense_39_873825:
??
dense_39_873827:	?"
dense_40_873830:	?
dense_40_873832:
identity??!conv2d_41/StatefulPartitionedCall?!conv2d_42/StatefulPartitionedCall?!conv2d_43/StatefulPartitionedCall? dense_38/StatefulPartitionedCall? dense_39/StatefulPartitionedCall? dense_40/StatefulPartitionedCall?"dropout_25/StatefulPartitionedCall?"dropout_26/StatefulPartitionedCall?"dropout_27/StatefulPartitionedCallo
rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2
rescaling_19/Cast/xs
rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rescaling_19/Cast_1/x?
rescaling_19/mulMulrescaling_19_inputrescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/mul?
rescaling_19/addAddV2rescaling_19/mul:z:0rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/add?
!conv2d_41/StatefulPartitionedCallStatefulPartitionedCallrescaling_19/add:z:0conv2d_41_873798conv2d_41_873800*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:??????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_41_layer_call_and_return_conditional_losses_8733282#
!conv2d_41/StatefulPartitionedCall?
 max_pooling2d_41/PartitionedCallPartitionedCall*conv2d_41/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_8732762"
 max_pooling2d_41/PartitionedCall?
"dropout_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_41/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_25_layer_call_and_return_conditional_losses_8736012$
"dropout_25/StatefulPartitionedCall?
!conv2d_42/StatefulPartitionedCallStatefulPartitionedCall+dropout_25/StatefulPartitionedCall:output:0conv2d_42_873805conv2d_42_873807*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????## *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_42_layer_call_and_return_conditional_losses_8733532#
!conv2d_42/StatefulPartitionedCall?
 max_pooling2d_42/PartitionedCallPartitionedCall*conv2d_42/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_8732882"
 max_pooling2d_42/PartitionedCall?
"dropout_26/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_42/PartitionedCall:output:0#^dropout_25/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_26_layer_call_and_return_conditional_losses_8735682$
"dropout_26/StatefulPartitionedCall?
!conv2d_43/StatefulPartitionedCallStatefulPartitionedCall+dropout_26/StatefulPartitionedCall:output:0conv2d_43_873812conv2d_43_873814*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????		@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_43_layer_call_and_return_conditional_losses_8733782#
!conv2d_43/StatefulPartitionedCall?
 max_pooling2d_43/PartitionedCallPartitionedCall*conv2d_43/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_8733002"
 max_pooling2d_43/PartitionedCall?
"dropout_27/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_43/PartitionedCall:output:0#^dropout_26/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_27_layer_call_and_return_conditional_losses_8735352$
"dropout_27/StatefulPartitionedCall?
flatten_19/PartitionedCallPartitionedCall+dropout_27/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_flatten_19_layer_call_and_return_conditional_losses_8733982
flatten_19/PartitionedCall?
 dense_38/StatefulPartitionedCallStatefulPartitionedCall#flatten_19/PartitionedCall:output:0dense_38_873820dense_38_873822*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_38_layer_call_and_return_conditional_losses_8734112"
 dense_38/StatefulPartitionedCall?
 dense_39/StatefulPartitionedCallStatefulPartitionedCall)dense_38/StatefulPartitionedCall:output:0dense_39_873825dense_39_873827*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_39_layer_call_and_return_conditional_losses_8734282"
 dense_39/StatefulPartitionedCall?
 dense_40/StatefulPartitionedCallStatefulPartitionedCall)dense_39/StatefulPartitionedCall:output:0dense_40_873830dense_40_873832*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_40_layer_call_and_return_conditional_losses_8734452"
 dense_40/StatefulPartitionedCall?
IdentityIdentity)dense_40/StatefulPartitionedCall:output:0"^conv2d_41/StatefulPartitionedCall"^conv2d_42/StatefulPartitionedCall"^conv2d_43/StatefulPartitionedCall!^dense_38/StatefulPartitionedCall!^dense_39/StatefulPartitionedCall!^dense_40/StatefulPartitionedCall#^dropout_25/StatefulPartitionedCall#^dropout_26/StatefulPartitionedCall#^dropout_27/StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2F
!conv2d_41/StatefulPartitionedCall!conv2d_41/StatefulPartitionedCall2F
!conv2d_42/StatefulPartitionedCall!conv2d_42/StatefulPartitionedCall2F
!conv2d_43/StatefulPartitionedCall!conv2d_43/StatefulPartitionedCall2D
 dense_38/StatefulPartitionedCall dense_38/StatefulPartitionedCall2D
 dense_39/StatefulPartitionedCall dense_39/StatefulPartitionedCall2D
 dense_40/StatefulPartitionedCall dense_40/StatefulPartitionedCall2H
"dropout_25/StatefulPartitionedCall"dropout_25/StatefulPartitionedCall2H
"dropout_26/StatefulPartitionedCall"dropout_26/StatefulPartitionedCall2H
"dropout_27/StatefulPartitionedCall"dropout_27/StatefulPartitionedCall:e a
1
_output_shapes
:???????????
,
_user_specified_namerescaling_19_input
?
b
F__inference_flatten_19_layer_call_and_return_conditional_losses_874215

inputs
identity_
ConstConst*
_output_shapes
:*
dtype0*
valueB"????   2
Consth
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:??????????2	
Reshapee
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?

?
$__inference_signature_wrapper_873873
rescaling_19_input!
unknown: 
	unknown_0: #
	unknown_1:  
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallrescaling_19_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? **
f%R#
!__inference__wrapped_model_8732702
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:e a
1
_output_shapes
:???????????
,
_user_specified_namerescaling_19_input
?
M
1__inference_max_pooling2d_43_layer_call_fn_873306

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4????????????????????????????????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_8733002
PartitionedCall?
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4????????????????????????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
?
.__inference_sequential_19_layer_call_fn_873479
rescaling_19_input!
unknown: 
	unknown_0: #
	unknown_1:  
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallrescaling_19_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *R
fMRK
I__inference_sequential_19_layer_call_and_return_conditional_losses_8734522
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:e a
1
_output_shapes
:???????????
,
_user_specified_namerescaling_19_input
?
?
E__inference_conv2d_42_layer_call_and_return_conditional_losses_873353

inputs8
conv2d_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?Conv2D/ReadVariableOp?
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:  *
dtype02
Conv2D/ReadVariableOp?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## *
paddingVALID*
strides
2
Conv2D?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## 2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:?????????## 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:?????????## 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????%% : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?
?
)__inference_dense_40_layer_call_fn_874280

inputs
unknown:	?
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_40_layer_call_and_return_conditional_losses_8734452
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
h
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_873276

inputs
identity?
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4????????????????????????????????????*
ksize
*
paddingVALID*
strides
2	
MaxPool?
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4????????????????????????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
?
*__inference_conv2d_41_layer_call_fn_874088

inputs!
unknown: 
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:??????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_41_layer_call_and_return_conditional_losses_8733282
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*1
_output_shapes
:??????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:???????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?
d
+__inference_dropout_25_layer_call_fn_874115

inputs
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_25_layer_call_and_return_conditional_losses_8736012
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:?????????%% 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????%% 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?
b
F__inference_flatten_19_layer_call_and_return_conditional_losses_873398

inputs
identity_
ConstConst*
_output_shapes
:*
dtype0*
valueB"????   2
Consth
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:??????????2	
Reshapee
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
E__inference_conv2d_41_layer_call_and_return_conditional_losses_874079

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?Conv2D/ReadVariableOp?
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype02
Conv2D/ReadVariableOp?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? *
paddingSAME*
strides
2
Conv2D?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? 2	
BiasAddb
ReluReluBiasAdd:output:0*
T0*1
_output_shapes
:??????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*1
_output_shapes
:??????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:???????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?
G
+__inference_dropout_25_layer_call_fn_874110

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_25_layer_call_and_return_conditional_losses_8733402
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:?????????%% 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????%% :W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?A
?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873690

inputs*
conv2d_41_873652: 
conv2d_41_873654: *
conv2d_42_873659:  
conv2d_42_873661: *
conv2d_43_873666: @
conv2d_43_873668:@#
dense_38_873674:
??
dense_38_873676:	?#
dense_39_873679:
??
dense_39_873681:	?"
dense_40_873684:	?
dense_40_873686:
identity??!conv2d_41/StatefulPartitionedCall?!conv2d_42/StatefulPartitionedCall?!conv2d_43/StatefulPartitionedCall? dense_38/StatefulPartitionedCall? dense_39/StatefulPartitionedCall? dense_40/StatefulPartitionedCall?"dropout_25/StatefulPartitionedCall?"dropout_26/StatefulPartitionedCall?"dropout_27/StatefulPartitionedCallo
rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2
rescaling_19/Cast/xs
rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rescaling_19/Cast_1/x?
rescaling_19/mulMulinputsrescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/mul?
rescaling_19/addAddV2rescaling_19/mul:z:0rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/add?
!conv2d_41/StatefulPartitionedCallStatefulPartitionedCallrescaling_19/add:z:0conv2d_41_873652conv2d_41_873654*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:??????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_41_layer_call_and_return_conditional_losses_8733282#
!conv2d_41/StatefulPartitionedCall?
 max_pooling2d_41/PartitionedCallPartitionedCall*conv2d_41/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_8732762"
 max_pooling2d_41/PartitionedCall?
"dropout_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_41/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_25_layer_call_and_return_conditional_losses_8736012$
"dropout_25/StatefulPartitionedCall?
!conv2d_42/StatefulPartitionedCallStatefulPartitionedCall+dropout_25/StatefulPartitionedCall:output:0conv2d_42_873659conv2d_42_873661*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????## *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_42_layer_call_and_return_conditional_losses_8733532#
!conv2d_42/StatefulPartitionedCall?
 max_pooling2d_42/PartitionedCallPartitionedCall*conv2d_42/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_8732882"
 max_pooling2d_42/PartitionedCall?
"dropout_26/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_42/PartitionedCall:output:0#^dropout_25/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_26_layer_call_and_return_conditional_losses_8735682$
"dropout_26/StatefulPartitionedCall?
!conv2d_43/StatefulPartitionedCallStatefulPartitionedCall+dropout_26/StatefulPartitionedCall:output:0conv2d_43_873666conv2d_43_873668*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????		@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_43_layer_call_and_return_conditional_losses_8733782#
!conv2d_43/StatefulPartitionedCall?
 max_pooling2d_43/PartitionedCallPartitionedCall*conv2d_43/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_8733002"
 max_pooling2d_43/PartitionedCall?
"dropout_27/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_43/PartitionedCall:output:0#^dropout_26/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_27_layer_call_and_return_conditional_losses_8735352$
"dropout_27/StatefulPartitionedCall?
flatten_19/PartitionedCallPartitionedCall+dropout_27/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_flatten_19_layer_call_and_return_conditional_losses_8733982
flatten_19/PartitionedCall?
 dense_38/StatefulPartitionedCallStatefulPartitionedCall#flatten_19/PartitionedCall:output:0dense_38_873674dense_38_873676*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_38_layer_call_and_return_conditional_losses_8734112"
 dense_38/StatefulPartitionedCall?
 dense_39/StatefulPartitionedCallStatefulPartitionedCall)dense_38/StatefulPartitionedCall:output:0dense_39_873679dense_39_873681*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_39_layer_call_and_return_conditional_losses_8734282"
 dense_39/StatefulPartitionedCall?
 dense_40/StatefulPartitionedCallStatefulPartitionedCall)dense_39/StatefulPartitionedCall:output:0dense_40_873684dense_40_873686*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_40_layer_call_and_return_conditional_losses_8734452"
 dense_40/StatefulPartitionedCall?
IdentityIdentity)dense_40/StatefulPartitionedCall:output:0"^conv2d_41/StatefulPartitionedCall"^conv2d_42/StatefulPartitionedCall"^conv2d_43/StatefulPartitionedCall!^dense_38/StatefulPartitionedCall!^dense_39/StatefulPartitionedCall!^dense_40/StatefulPartitionedCall#^dropout_25/StatefulPartitionedCall#^dropout_26/StatefulPartitionedCall#^dropout_27/StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2F
!conv2d_41/StatefulPartitionedCall!conv2d_41/StatefulPartitionedCall2F
!conv2d_42/StatefulPartitionedCall!conv2d_42/StatefulPartitionedCall2F
!conv2d_43/StatefulPartitionedCall!conv2d_43/StatefulPartitionedCall2D
 dense_38/StatefulPartitionedCall dense_38/StatefulPartitionedCall2D
 dense_39/StatefulPartitionedCall dense_39/StatefulPartitionedCall2D
 dense_40/StatefulPartitionedCall dense_40/StatefulPartitionedCall2H
"dropout_25/StatefulPartitionedCall"dropout_25/StatefulPartitionedCall2H
"dropout_26/StatefulPartitionedCall"dropout_26/StatefulPartitionedCall2H
"dropout_27/StatefulPartitionedCall"dropout_27/StatefulPartitionedCall:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?L
?	
I__inference_sequential_19_layer_call_and_return_conditional_losses_873931

inputsB
(conv2d_41_conv2d_readvariableop_resource: 7
)conv2d_41_biasadd_readvariableop_resource: B
(conv2d_42_conv2d_readvariableop_resource:  7
)conv2d_42_biasadd_readvariableop_resource: B
(conv2d_43_conv2d_readvariableop_resource: @7
)conv2d_43_biasadd_readvariableop_resource:@;
'dense_38_matmul_readvariableop_resource:
??7
(dense_38_biasadd_readvariableop_resource:	?;
'dense_39_matmul_readvariableop_resource:
??7
(dense_39_biasadd_readvariableop_resource:	?:
'dense_40_matmul_readvariableop_resource:	?6
(dense_40_biasadd_readvariableop_resource:
identity?? conv2d_41/BiasAdd/ReadVariableOp?conv2d_41/Conv2D/ReadVariableOp? conv2d_42/BiasAdd/ReadVariableOp?conv2d_42/Conv2D/ReadVariableOp? conv2d_43/BiasAdd/ReadVariableOp?conv2d_43/Conv2D/ReadVariableOp?dense_38/BiasAdd/ReadVariableOp?dense_38/MatMul/ReadVariableOp?dense_39/BiasAdd/ReadVariableOp?dense_39/MatMul/ReadVariableOp?dense_40/BiasAdd/ReadVariableOp?dense_40/MatMul/ReadVariableOpo
rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2
rescaling_19/Cast/xs
rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rescaling_19/Cast_1/x?
rescaling_19/mulMulinputsrescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/mul?
rescaling_19/addAddV2rescaling_19/mul:z:0rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/add?
conv2d_41/Conv2D/ReadVariableOpReadVariableOp(conv2d_41_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype02!
conv2d_41/Conv2D/ReadVariableOp?
conv2d_41/Conv2DConv2Drescaling_19/add:z:0'conv2d_41/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? *
paddingSAME*
strides
2
conv2d_41/Conv2D?
 conv2d_41/BiasAdd/ReadVariableOpReadVariableOp)conv2d_41_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02"
 conv2d_41/BiasAdd/ReadVariableOp?
conv2d_41/BiasAddBiasAddconv2d_41/Conv2D:output:0(conv2d_41/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? 2
conv2d_41/BiasAdd?
conv2d_41/ReluReluconv2d_41/BiasAdd:output:0*
T0*1
_output_shapes
:??????????? 2
conv2d_41/Relu?
max_pooling2d_41/MaxPoolMaxPoolconv2d_41/Relu:activations:0*/
_output_shapes
:?????????%% *
ksize
*
paddingVALID*
strides
2
max_pooling2d_41/MaxPool?
dropout_25/IdentityIdentity!max_pooling2d_41/MaxPool:output:0*
T0*/
_output_shapes
:?????????%% 2
dropout_25/Identity?
conv2d_42/Conv2D/ReadVariableOpReadVariableOp(conv2d_42_conv2d_readvariableop_resource*&
_output_shapes
:  *
dtype02!
conv2d_42/Conv2D/ReadVariableOp?
conv2d_42/Conv2DConv2Ddropout_25/Identity:output:0'conv2d_42/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## *
paddingVALID*
strides
2
conv2d_42/Conv2D?
 conv2d_42/BiasAdd/ReadVariableOpReadVariableOp)conv2d_42_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02"
 conv2d_42/BiasAdd/ReadVariableOp?
conv2d_42/BiasAddBiasAddconv2d_42/Conv2D:output:0(conv2d_42/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## 2
conv2d_42/BiasAdd~
conv2d_42/ReluReluconv2d_42/BiasAdd:output:0*
T0*/
_output_shapes
:?????????## 2
conv2d_42/Relu?
max_pooling2d_42/MaxPoolMaxPoolconv2d_42/Relu:activations:0*/
_output_shapes
:????????? *
ksize
*
paddingVALID*
strides
2
max_pooling2d_42/MaxPool?
dropout_26/IdentityIdentity!max_pooling2d_42/MaxPool:output:0*
T0*/
_output_shapes
:????????? 2
dropout_26/Identity?
conv2d_43/Conv2D/ReadVariableOpReadVariableOp(conv2d_43_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02!
conv2d_43/Conv2D/ReadVariableOp?
conv2d_43/Conv2DConv2Ddropout_26/Identity:output:0'conv2d_43/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@*
paddingVALID*
strides
2
conv2d_43/Conv2D?
 conv2d_43/BiasAdd/ReadVariableOpReadVariableOp)conv2d_43_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02"
 conv2d_43/BiasAdd/ReadVariableOp?
conv2d_43/BiasAddBiasAddconv2d_43/Conv2D:output:0(conv2d_43/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@2
conv2d_43/BiasAdd~
conv2d_43/ReluReluconv2d_43/BiasAdd:output:0*
T0*/
_output_shapes
:?????????		@2
conv2d_43/Relu?
max_pooling2d_43/MaxPoolMaxPoolconv2d_43/Relu:activations:0*/
_output_shapes
:?????????@*
ksize
*
paddingVALID*
strides
2
max_pooling2d_43/MaxPool?
dropout_27/IdentityIdentity!max_pooling2d_43/MaxPool:output:0*
T0*/
_output_shapes
:?????????@2
dropout_27/Identityu
flatten_19/ConstConst*
_output_shapes
:*
dtype0*
valueB"????   2
flatten_19/Const?
flatten_19/ReshapeReshapedropout_27/Identity:output:0flatten_19/Const:output:0*
T0*(
_output_shapes
:??????????2
flatten_19/Reshape?
dense_38/MatMul/ReadVariableOpReadVariableOp'dense_38_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02 
dense_38/MatMul/ReadVariableOp?
dense_38/MatMulMatMulflatten_19/Reshape:output:0&dense_38/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_38/MatMul?
dense_38/BiasAdd/ReadVariableOpReadVariableOp(dense_38_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02!
dense_38/BiasAdd/ReadVariableOp?
dense_38/BiasAddBiasAdddense_38/MatMul:product:0'dense_38/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_38/BiasAddt
dense_38/ReluReludense_38/BiasAdd:output:0*
T0*(
_output_shapes
:??????????2
dense_38/Relu?
dense_39/MatMul/ReadVariableOpReadVariableOp'dense_39_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02 
dense_39/MatMul/ReadVariableOp?
dense_39/MatMulMatMuldense_38/Relu:activations:0&dense_39/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_39/MatMul?
dense_39/BiasAdd/ReadVariableOpReadVariableOp(dense_39_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02!
dense_39/BiasAdd/ReadVariableOp?
dense_39/BiasAddBiasAdddense_39/MatMul:product:0'dense_39/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_39/BiasAddt
dense_39/ReluReludense_39/BiasAdd:output:0*
T0*(
_output_shapes
:??????????2
dense_39/Relu?
dense_40/MatMul/ReadVariableOpReadVariableOp'dense_40_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype02 
dense_40/MatMul/ReadVariableOp?
dense_40/MatMulMatMuldense_39/Relu:activations:0&dense_40/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_40/MatMul?
dense_40/BiasAdd/ReadVariableOpReadVariableOp(dense_40_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02!
dense_40/BiasAdd/ReadVariableOp?
dense_40/BiasAddBiasAdddense_40/MatMul:product:0'dense_40/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_40/BiasAdd|
dense_40/SoftmaxSoftmaxdense_40/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2
dense_40/Softmax?
IdentityIdentitydense_40/Softmax:softmax:0!^conv2d_41/BiasAdd/ReadVariableOp ^conv2d_41/Conv2D/ReadVariableOp!^conv2d_42/BiasAdd/ReadVariableOp ^conv2d_42/Conv2D/ReadVariableOp!^conv2d_43/BiasAdd/ReadVariableOp ^conv2d_43/Conv2D/ReadVariableOp ^dense_38/BiasAdd/ReadVariableOp^dense_38/MatMul/ReadVariableOp ^dense_39/BiasAdd/ReadVariableOp^dense_39/MatMul/ReadVariableOp ^dense_40/BiasAdd/ReadVariableOp^dense_40/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2D
 conv2d_41/BiasAdd/ReadVariableOp conv2d_41/BiasAdd/ReadVariableOp2B
conv2d_41/Conv2D/ReadVariableOpconv2d_41/Conv2D/ReadVariableOp2D
 conv2d_42/BiasAdd/ReadVariableOp conv2d_42/BiasAdd/ReadVariableOp2B
conv2d_42/Conv2D/ReadVariableOpconv2d_42/Conv2D/ReadVariableOp2D
 conv2d_43/BiasAdd/ReadVariableOp conv2d_43/BiasAdd/ReadVariableOp2B
conv2d_43/Conv2D/ReadVariableOpconv2d_43/Conv2D/ReadVariableOp2B
dense_38/BiasAdd/ReadVariableOpdense_38/BiasAdd/ReadVariableOp2@
dense_38/MatMul/ReadVariableOpdense_38/MatMul/ReadVariableOp2B
dense_39/BiasAdd/ReadVariableOpdense_39/BiasAdd/ReadVariableOp2@
dense_39/MatMul/ReadVariableOpdense_39/MatMul/ReadVariableOp2B
dense_40/BiasAdd/ReadVariableOpdense_40/BiasAdd/ReadVariableOp2@
dense_40/MatMul/ReadVariableOpdense_40/MatMul/ReadVariableOp:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?
d
F__inference_dropout_25_layer_call_and_return_conditional_losses_874093

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:?????????%% 2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:?????????%% 2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????%% :W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?<
?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873791
rescaling_19_input*
conv2d_41_873753: 
conv2d_41_873755: *
conv2d_42_873760:  
conv2d_42_873762: *
conv2d_43_873767: @
conv2d_43_873769:@#
dense_38_873775:
??
dense_38_873777:	?#
dense_39_873780:
??
dense_39_873782:	?"
dense_40_873785:	?
dense_40_873787:
identity??!conv2d_41/StatefulPartitionedCall?!conv2d_42/StatefulPartitionedCall?!conv2d_43/StatefulPartitionedCall? dense_38/StatefulPartitionedCall? dense_39/StatefulPartitionedCall? dense_40/StatefulPartitionedCallo
rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2
rescaling_19/Cast/xs
rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rescaling_19/Cast_1/x?
rescaling_19/mulMulrescaling_19_inputrescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/mul?
rescaling_19/addAddV2rescaling_19/mul:z:0rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/add?
!conv2d_41/StatefulPartitionedCallStatefulPartitionedCallrescaling_19/add:z:0conv2d_41_873753conv2d_41_873755*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:??????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_41_layer_call_and_return_conditional_losses_8733282#
!conv2d_41/StatefulPartitionedCall?
 max_pooling2d_41/PartitionedCallPartitionedCall*conv2d_41/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_8732762"
 max_pooling2d_41/PartitionedCall?
dropout_25/PartitionedCallPartitionedCall)max_pooling2d_41/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????%% * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_25_layer_call_and_return_conditional_losses_8733402
dropout_25/PartitionedCall?
!conv2d_42/StatefulPartitionedCallStatefulPartitionedCall#dropout_25/PartitionedCall:output:0conv2d_42_873760conv2d_42_873762*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????## *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_42_layer_call_and_return_conditional_losses_8733532#
!conv2d_42/StatefulPartitionedCall?
 max_pooling2d_42/PartitionedCallPartitionedCall*conv2d_42/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_8732882"
 max_pooling2d_42/PartitionedCall?
dropout_26/PartitionedCallPartitionedCall)max_pooling2d_42/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_26_layer_call_and_return_conditional_losses_8733652
dropout_26/PartitionedCall?
!conv2d_43/StatefulPartitionedCallStatefulPartitionedCall#dropout_26/PartitionedCall:output:0conv2d_43_873767conv2d_43_873769*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????		@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_43_layer_call_and_return_conditional_losses_8733782#
!conv2d_43/StatefulPartitionedCall?
 max_pooling2d_43/PartitionedCallPartitionedCall*conv2d_43/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_8733002"
 max_pooling2d_43/PartitionedCall?
dropout_27/PartitionedCallPartitionedCall)max_pooling2d_43/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_27_layer_call_and_return_conditional_losses_8733902
dropout_27/PartitionedCall?
flatten_19/PartitionedCallPartitionedCall#dropout_27/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_flatten_19_layer_call_and_return_conditional_losses_8733982
flatten_19/PartitionedCall?
 dense_38/StatefulPartitionedCallStatefulPartitionedCall#flatten_19/PartitionedCall:output:0dense_38_873775dense_38_873777*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_38_layer_call_and_return_conditional_losses_8734112"
 dense_38/StatefulPartitionedCall?
 dense_39/StatefulPartitionedCallStatefulPartitionedCall)dense_38/StatefulPartitionedCall:output:0dense_39_873780dense_39_873782*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_39_layer_call_and_return_conditional_losses_8734282"
 dense_39/StatefulPartitionedCall?
 dense_40/StatefulPartitionedCallStatefulPartitionedCall)dense_39/StatefulPartitionedCall:output:0dense_40_873785dense_40_873787*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dense_40_layer_call_and_return_conditional_losses_8734452"
 dense_40/StatefulPartitionedCall?
IdentityIdentity)dense_40/StatefulPartitionedCall:output:0"^conv2d_41/StatefulPartitionedCall"^conv2d_42/StatefulPartitionedCall"^conv2d_43/StatefulPartitionedCall!^dense_38/StatefulPartitionedCall!^dense_39/StatefulPartitionedCall!^dense_40/StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2F
!conv2d_41/StatefulPartitionedCall!conv2d_41/StatefulPartitionedCall2F
!conv2d_42/StatefulPartitionedCall!conv2d_42/StatefulPartitionedCall2F
!conv2d_43/StatefulPartitionedCall!conv2d_43/StatefulPartitionedCall2D
 dense_38/StatefulPartitionedCall dense_38/StatefulPartitionedCall2D
 dense_39/StatefulPartitionedCall dense_39/StatefulPartitionedCall2D
 dense_40/StatefulPartitionedCall dense_40/StatefulPartitionedCall:e a
1
_output_shapes
:???????????
,
_user_specified_namerescaling_19_input
?

?
D__inference_dense_40_layer_call_and_return_conditional_losses_874271

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:?????????2	
Softmax?
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
d
F__inference_dropout_26_layer_call_and_return_conditional_losses_873365

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:????????? 2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:????????? 2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? :W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
G
+__inference_dropout_26_layer_call_fn_874157

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:????????? * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_26_layer_call_and_return_conditional_losses_8733652
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? :W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
h
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_873300

inputs
identity?
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4????????????????????????????????????*
ksize
*
paddingVALID*
strides
2	
MaxPool?
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4????????????????????????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
e
F__inference_dropout_25_layer_call_and_return_conditional_losses_874105

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:?????????%% 2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:?????????%% *
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:?????????%% 2
dropout/GreaterEqual?
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:?????????%% 2
dropout/Cast?
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:?????????%% 2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:?????????%% 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????%% :W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?

?
.__inference_sequential_19_layer_call_fn_874039

inputs!
unknown: 
	unknown_0: #
	unknown_1:  
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *R
fMRK
I__inference_sequential_19_layer_call_and_return_conditional_losses_8734522
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?

?
D__inference_dense_39_layer_call_and_return_conditional_losses_874251

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:??????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
h
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_873288

inputs
identity?
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4????????????????????????????????????*
ksize
*
paddingVALID*
strides
2	
MaxPool?
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4????????????????????????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
d
F__inference_dropout_27_layer_call_and_return_conditional_losses_874187

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:?????????@2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:?????????@2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
.__inference_sequential_19_layer_call_fn_873746
rescaling_19_input!
unknown: 
	unknown_0: #
	unknown_1:  
	unknown_2: #
	unknown_3: @
	unknown_4:@
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallrescaling_19_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *R
fMRK
I__inference_sequential_19_layer_call_and_return_conditional_losses_8736902
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:e a
1
_output_shapes
:???????????
,
_user_specified_namerescaling_19_input
?i
?	
I__inference_sequential_19_layer_call_and_return_conditional_losses_874010

inputsB
(conv2d_41_conv2d_readvariableop_resource: 7
)conv2d_41_biasadd_readvariableop_resource: B
(conv2d_42_conv2d_readvariableop_resource:  7
)conv2d_42_biasadd_readvariableop_resource: B
(conv2d_43_conv2d_readvariableop_resource: @7
)conv2d_43_biasadd_readvariableop_resource:@;
'dense_38_matmul_readvariableop_resource:
??7
(dense_38_biasadd_readvariableop_resource:	?;
'dense_39_matmul_readvariableop_resource:
??7
(dense_39_biasadd_readvariableop_resource:	?:
'dense_40_matmul_readvariableop_resource:	?6
(dense_40_biasadd_readvariableop_resource:
identity?? conv2d_41/BiasAdd/ReadVariableOp?conv2d_41/Conv2D/ReadVariableOp? conv2d_42/BiasAdd/ReadVariableOp?conv2d_42/Conv2D/ReadVariableOp? conv2d_43/BiasAdd/ReadVariableOp?conv2d_43/Conv2D/ReadVariableOp?dense_38/BiasAdd/ReadVariableOp?dense_38/MatMul/ReadVariableOp?dense_39/BiasAdd/ReadVariableOp?dense_39/MatMul/ReadVariableOp?dense_40/BiasAdd/ReadVariableOp?dense_40/MatMul/ReadVariableOpo
rescaling_19/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *???;2
rescaling_19/Cast/xs
rescaling_19/Cast_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rescaling_19/Cast_1/x?
rescaling_19/mulMulinputsrescaling_19/Cast/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/mul?
rescaling_19/addAddV2rescaling_19/mul:z:0rescaling_19/Cast_1/x:output:0*
T0*1
_output_shapes
:???????????2
rescaling_19/add?
conv2d_41/Conv2D/ReadVariableOpReadVariableOp(conv2d_41_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype02!
conv2d_41/Conv2D/ReadVariableOp?
conv2d_41/Conv2DConv2Drescaling_19/add:z:0'conv2d_41/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? *
paddingSAME*
strides
2
conv2d_41/Conv2D?
 conv2d_41/BiasAdd/ReadVariableOpReadVariableOp)conv2d_41_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02"
 conv2d_41/BiasAdd/ReadVariableOp?
conv2d_41/BiasAddBiasAddconv2d_41/Conv2D:output:0(conv2d_41/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:??????????? 2
conv2d_41/BiasAdd?
conv2d_41/ReluReluconv2d_41/BiasAdd:output:0*
T0*1
_output_shapes
:??????????? 2
conv2d_41/Relu?
max_pooling2d_41/MaxPoolMaxPoolconv2d_41/Relu:activations:0*/
_output_shapes
:?????????%% *
ksize
*
paddingVALID*
strides
2
max_pooling2d_41/MaxPooly
dropout_25/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout_25/dropout/Const?
dropout_25/dropout/MulMul!max_pooling2d_41/MaxPool:output:0!dropout_25/dropout/Const:output:0*
T0*/
_output_shapes
:?????????%% 2
dropout_25/dropout/Mul?
dropout_25/dropout/ShapeShape!max_pooling2d_41/MaxPool:output:0*
T0*
_output_shapes
:2
dropout_25/dropout/Shape?
/dropout_25/dropout/random_uniform/RandomUniformRandomUniform!dropout_25/dropout/Shape:output:0*
T0*/
_output_shapes
:?????????%% *
dtype021
/dropout_25/dropout/random_uniform/RandomUniform?
!dropout_25/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2#
!dropout_25/dropout/GreaterEqual/y?
dropout_25/dropout/GreaterEqualGreaterEqual8dropout_25/dropout/random_uniform/RandomUniform:output:0*dropout_25/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:?????????%% 2!
dropout_25/dropout/GreaterEqual?
dropout_25/dropout/CastCast#dropout_25/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:?????????%% 2
dropout_25/dropout/Cast?
dropout_25/dropout/Mul_1Muldropout_25/dropout/Mul:z:0dropout_25/dropout/Cast:y:0*
T0*/
_output_shapes
:?????????%% 2
dropout_25/dropout/Mul_1?
conv2d_42/Conv2D/ReadVariableOpReadVariableOp(conv2d_42_conv2d_readvariableop_resource*&
_output_shapes
:  *
dtype02!
conv2d_42/Conv2D/ReadVariableOp?
conv2d_42/Conv2DConv2Ddropout_25/dropout/Mul_1:z:0'conv2d_42/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## *
paddingVALID*
strides
2
conv2d_42/Conv2D?
 conv2d_42/BiasAdd/ReadVariableOpReadVariableOp)conv2d_42_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02"
 conv2d_42/BiasAdd/ReadVariableOp?
conv2d_42/BiasAddBiasAddconv2d_42/Conv2D:output:0(conv2d_42/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## 2
conv2d_42/BiasAdd~
conv2d_42/ReluReluconv2d_42/BiasAdd:output:0*
T0*/
_output_shapes
:?????????## 2
conv2d_42/Relu?
max_pooling2d_42/MaxPoolMaxPoolconv2d_42/Relu:activations:0*/
_output_shapes
:????????? *
ksize
*
paddingVALID*
strides
2
max_pooling2d_42/MaxPooly
dropout_26/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout_26/dropout/Const?
dropout_26/dropout/MulMul!max_pooling2d_42/MaxPool:output:0!dropout_26/dropout/Const:output:0*
T0*/
_output_shapes
:????????? 2
dropout_26/dropout/Mul?
dropout_26/dropout/ShapeShape!max_pooling2d_42/MaxPool:output:0*
T0*
_output_shapes
:2
dropout_26/dropout/Shape?
/dropout_26/dropout/random_uniform/RandomUniformRandomUniform!dropout_26/dropout/Shape:output:0*
T0*/
_output_shapes
:????????? *
dtype021
/dropout_26/dropout/random_uniform/RandomUniform?
!dropout_26/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2#
!dropout_26/dropout/GreaterEqual/y?
dropout_26/dropout/GreaterEqualGreaterEqual8dropout_26/dropout/random_uniform/RandomUniform:output:0*dropout_26/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:????????? 2!
dropout_26/dropout/GreaterEqual?
dropout_26/dropout/CastCast#dropout_26/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:????????? 2
dropout_26/dropout/Cast?
dropout_26/dropout/Mul_1Muldropout_26/dropout/Mul:z:0dropout_26/dropout/Cast:y:0*
T0*/
_output_shapes
:????????? 2
dropout_26/dropout/Mul_1?
conv2d_43/Conv2D/ReadVariableOpReadVariableOp(conv2d_43_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02!
conv2d_43/Conv2D/ReadVariableOp?
conv2d_43/Conv2DConv2Ddropout_26/dropout/Mul_1:z:0'conv2d_43/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@*
paddingVALID*
strides
2
conv2d_43/Conv2D?
 conv2d_43/BiasAdd/ReadVariableOpReadVariableOp)conv2d_43_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02"
 conv2d_43/BiasAdd/ReadVariableOp?
conv2d_43/BiasAddBiasAddconv2d_43/Conv2D:output:0(conv2d_43/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@2
conv2d_43/BiasAdd~
conv2d_43/ReluReluconv2d_43/BiasAdd:output:0*
T0*/
_output_shapes
:?????????		@2
conv2d_43/Relu?
max_pooling2d_43/MaxPoolMaxPoolconv2d_43/Relu:activations:0*/
_output_shapes
:?????????@*
ksize
*
paddingVALID*
strides
2
max_pooling2d_43/MaxPooly
dropout_27/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout_27/dropout/Const?
dropout_27/dropout/MulMul!max_pooling2d_43/MaxPool:output:0!dropout_27/dropout/Const:output:0*
T0*/
_output_shapes
:?????????@2
dropout_27/dropout/Mul?
dropout_27/dropout/ShapeShape!max_pooling2d_43/MaxPool:output:0*
T0*
_output_shapes
:2
dropout_27/dropout/Shape?
/dropout_27/dropout/random_uniform/RandomUniformRandomUniform!dropout_27/dropout/Shape:output:0*
T0*/
_output_shapes
:?????????@*
dtype021
/dropout_27/dropout/random_uniform/RandomUniform?
!dropout_27/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2#
!dropout_27/dropout/GreaterEqual/y?
dropout_27/dropout/GreaterEqualGreaterEqual8dropout_27/dropout/random_uniform/RandomUniform:output:0*dropout_27/dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:?????????@2!
dropout_27/dropout/GreaterEqual?
dropout_27/dropout/CastCast#dropout_27/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:?????????@2
dropout_27/dropout/Cast?
dropout_27/dropout/Mul_1Muldropout_27/dropout/Mul:z:0dropout_27/dropout/Cast:y:0*
T0*/
_output_shapes
:?????????@2
dropout_27/dropout/Mul_1u
flatten_19/ConstConst*
_output_shapes
:*
dtype0*
valueB"????   2
flatten_19/Const?
flatten_19/ReshapeReshapedropout_27/dropout/Mul_1:z:0flatten_19/Const:output:0*
T0*(
_output_shapes
:??????????2
flatten_19/Reshape?
dense_38/MatMul/ReadVariableOpReadVariableOp'dense_38_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02 
dense_38/MatMul/ReadVariableOp?
dense_38/MatMulMatMulflatten_19/Reshape:output:0&dense_38/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_38/MatMul?
dense_38/BiasAdd/ReadVariableOpReadVariableOp(dense_38_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02!
dense_38/BiasAdd/ReadVariableOp?
dense_38/BiasAddBiasAdddense_38/MatMul:product:0'dense_38/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_38/BiasAddt
dense_38/ReluReludense_38/BiasAdd:output:0*
T0*(
_output_shapes
:??????????2
dense_38/Relu?
dense_39/MatMul/ReadVariableOpReadVariableOp'dense_39_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02 
dense_39/MatMul/ReadVariableOp?
dense_39/MatMulMatMuldense_38/Relu:activations:0&dense_39/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_39/MatMul?
dense_39/BiasAdd/ReadVariableOpReadVariableOp(dense_39_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02!
dense_39/BiasAdd/ReadVariableOp?
dense_39/BiasAddBiasAdddense_39/MatMul:product:0'dense_39/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_39/BiasAddt
dense_39/ReluReludense_39/BiasAdd:output:0*
T0*(
_output_shapes
:??????????2
dense_39/Relu?
dense_40/MatMul/ReadVariableOpReadVariableOp'dense_40_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype02 
dense_40/MatMul/ReadVariableOp?
dense_40/MatMulMatMuldense_39/Relu:activations:0&dense_40/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_40/MatMul?
dense_40/BiasAdd/ReadVariableOpReadVariableOp(dense_40_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02!
dense_40/BiasAdd/ReadVariableOp?
dense_40/BiasAddBiasAdddense_40/MatMul:product:0'dense_40/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_40/BiasAdd|
dense_40/SoftmaxSoftmaxdense_40/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2
dense_40/Softmax?
IdentityIdentitydense_40/Softmax:softmax:0!^conv2d_41/BiasAdd/ReadVariableOp ^conv2d_41/Conv2D/ReadVariableOp!^conv2d_42/BiasAdd/ReadVariableOp ^conv2d_42/Conv2D/ReadVariableOp!^conv2d_43/BiasAdd/ReadVariableOp ^conv2d_43/Conv2D/ReadVariableOp ^dense_38/BiasAdd/ReadVariableOp^dense_38/MatMul/ReadVariableOp ^dense_39/BiasAdd/ReadVariableOp^dense_39/MatMul/ReadVariableOp ^dense_40/BiasAdd/ReadVariableOp^dense_40/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:???????????: : : : : : : : : : : : 2D
 conv2d_41/BiasAdd/ReadVariableOp conv2d_41/BiasAdd/ReadVariableOp2B
conv2d_41/Conv2D/ReadVariableOpconv2d_41/Conv2D/ReadVariableOp2D
 conv2d_42/BiasAdd/ReadVariableOp conv2d_42/BiasAdd/ReadVariableOp2B
conv2d_42/Conv2D/ReadVariableOpconv2d_42/Conv2D/ReadVariableOp2D
 conv2d_43/BiasAdd/ReadVariableOp conv2d_43/BiasAdd/ReadVariableOp2B
conv2d_43/Conv2D/ReadVariableOpconv2d_43/Conv2D/ReadVariableOp2B
dense_38/BiasAdd/ReadVariableOpdense_38/BiasAdd/ReadVariableOp2@
dense_38/MatMul/ReadVariableOpdense_38/MatMul/ReadVariableOp2B
dense_39/BiasAdd/ReadVariableOpdense_39/BiasAdd/ReadVariableOp2@
dense_39/MatMul/ReadVariableOpdense_39/MatMul/ReadVariableOp2B
dense_40/BiasAdd/ReadVariableOpdense_40/BiasAdd/ReadVariableOp2@
dense_40/MatMul/ReadVariableOpdense_40/MatMul/ReadVariableOp:Y U
1
_output_shapes
:???????????
 
_user_specified_nameinputs
?
d
F__inference_dropout_27_layer_call_and_return_conditional_losses_873390

inputs

identity_1b
IdentityIdentityinputs*
T0*/
_output_shapes
:?????????@2

Identityq

Identity_1IdentityIdentity:output:0*
T0*/
_output_shapes
:?????????@2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
*__inference_conv2d_42_layer_call_fn_874135

inputs!
unknown:  
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????## *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *N
fIRG
E__inference_conv2d_42_layer_call_and_return_conditional_losses_8733532
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:?????????## 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????%% : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?
?
E__inference_conv2d_43_layer_call_and_return_conditional_losses_874173

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity??BiasAdd/ReadVariableOp?Conv2D/ReadVariableOp?
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02
Conv2D/ReadVariableOp?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@*
paddingVALID*
strides
2
Conv2D?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????		@2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:?????????		@2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:?????????		@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
e
F__inference_dropout_26_layer_call_and_return_conditional_losses_874152

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:????????? 2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:????????? *
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:????????? 2
dropout/GreaterEqual?
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:????????? 2
dropout/Cast?
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:????????? 2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? :W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
?
E__inference_conv2d_42_layer_call_and_return_conditional_losses_874126

inputs8
conv2d_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?Conv2D/ReadVariableOp?
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:  *
dtype02
Conv2D/ReadVariableOp?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## *
paddingVALID*
strides
2
Conv2D?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????## 2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:?????????## 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:?????????## 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:?????????%% : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?
M
1__inference_max_pooling2d_42_layer_call_fn_873294

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4????????????????????????????????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_8732882
PartitionedCall?
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4????????????????????????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
d
+__inference_dropout_27_layer_call_fn_874209

inputs
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_dropout_27_layer_call_and_return_conditional_losses_8735352
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:?????????@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
M
1__inference_max_pooling2d_41_layer_call_fn_873282

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4????????????????????????????????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *U
fPRN
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_8732762
PartitionedCall?
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4????????????????????????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?

?
D__inference_dense_38_layer_call_and_return_conditional_losses_874231

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddY
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:??????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*(
_output_shapes
:??????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
e
F__inference_dropout_25_layer_call_and_return_conditional_losses_873601

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:?????????%% 2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:?????????%% *
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:?????????%% 2
dropout/GreaterEqual?
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:?????????%% 2
dropout/Cast?
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:?????????%% 2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:?????????%% 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????%% :W S
/
_output_shapes
:?????????%% 
 
_user_specified_nameinputs
?]
?
__inference__traced_save_874438
file_prefix/
+savev2_conv2d_41_kernel_read_readvariableop-
)savev2_conv2d_41_bias_read_readvariableop/
+savev2_conv2d_42_kernel_read_readvariableop-
)savev2_conv2d_42_bias_read_readvariableop/
+savev2_conv2d_43_kernel_read_readvariableop-
)savev2_conv2d_43_bias_read_readvariableop.
*savev2_dense_38_kernel_read_readvariableop,
(savev2_dense_38_bias_read_readvariableop.
*savev2_dense_39_kernel_read_readvariableop,
(savev2_dense_39_bias_read_readvariableop.
*savev2_dense_40_kernel_read_readvariableop,
(savev2_dense_40_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop6
2savev2_adam_conv2d_41_kernel_m_read_readvariableop4
0savev2_adam_conv2d_41_bias_m_read_readvariableop6
2savev2_adam_conv2d_42_kernel_m_read_readvariableop4
0savev2_adam_conv2d_42_bias_m_read_readvariableop6
2savev2_adam_conv2d_43_kernel_m_read_readvariableop4
0savev2_adam_conv2d_43_bias_m_read_readvariableop5
1savev2_adam_dense_38_kernel_m_read_readvariableop3
/savev2_adam_dense_38_bias_m_read_readvariableop5
1savev2_adam_dense_39_kernel_m_read_readvariableop3
/savev2_adam_dense_39_bias_m_read_readvariableop5
1savev2_adam_dense_40_kernel_m_read_readvariableop3
/savev2_adam_dense_40_bias_m_read_readvariableop6
2savev2_adam_conv2d_41_kernel_v_read_readvariableop4
0savev2_adam_conv2d_41_bias_v_read_readvariableop6
2savev2_adam_conv2d_42_kernel_v_read_readvariableop4
0savev2_adam_conv2d_42_bias_v_read_readvariableop6
2savev2_adam_conv2d_43_kernel_v_read_readvariableop4
0savev2_adam_conv2d_43_bias_v_read_readvariableop5
1savev2_adam_dense_38_kernel_v_read_readvariableop3
/savev2_adam_dense_38_bias_v_read_readvariableop5
1savev2_adam_dense_39_kernel_v_read_readvariableop3
/savev2_adam_dense_39_bias_v_read_readvariableop5
1savev2_adam_dense_40_kernel_v_read_readvariableop3
/savev2_adam_dense_40_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*?
value?B?.B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0+savev2_conv2d_41_kernel_read_readvariableop)savev2_conv2d_41_bias_read_readvariableop+savev2_conv2d_42_kernel_read_readvariableop)savev2_conv2d_42_bias_read_readvariableop+savev2_conv2d_43_kernel_read_readvariableop)savev2_conv2d_43_bias_read_readvariableop*savev2_dense_38_kernel_read_readvariableop(savev2_dense_38_bias_read_readvariableop*savev2_dense_39_kernel_read_readvariableop(savev2_dense_39_bias_read_readvariableop*savev2_dense_40_kernel_read_readvariableop(savev2_dense_40_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop2savev2_adam_conv2d_41_kernel_m_read_readvariableop0savev2_adam_conv2d_41_bias_m_read_readvariableop2savev2_adam_conv2d_42_kernel_m_read_readvariableop0savev2_adam_conv2d_42_bias_m_read_readvariableop2savev2_adam_conv2d_43_kernel_m_read_readvariableop0savev2_adam_conv2d_43_bias_m_read_readvariableop1savev2_adam_dense_38_kernel_m_read_readvariableop/savev2_adam_dense_38_bias_m_read_readvariableop1savev2_adam_dense_39_kernel_m_read_readvariableop/savev2_adam_dense_39_bias_m_read_readvariableop1savev2_adam_dense_40_kernel_m_read_readvariableop/savev2_adam_dense_40_bias_m_read_readvariableop2savev2_adam_conv2d_41_kernel_v_read_readvariableop0savev2_adam_conv2d_41_bias_v_read_readvariableop2savev2_adam_conv2d_42_kernel_v_read_readvariableop0savev2_adam_conv2d_42_bias_v_read_readvariableop2savev2_adam_conv2d_43_kernel_v_read_readvariableop0savev2_adam_conv2d_43_bias_v_read_readvariableop1savev2_adam_dense_38_kernel_v_read_readvariableop/savev2_adam_dense_38_bias_v_read_readvariableop1savev2_adam_dense_39_kernel_v_read_readvariableop/savev2_adam_dense_39_bias_v_read_readvariableop1savev2_adam_dense_40_kernel_v_read_readvariableop/savev2_adam_dense_40_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *<
dtypes2
02.	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*?
_input_shapes?
?: : : :  : : @:@:
??:?:
??:?:	?:: : : : : : : : : : : :  : : @:@:
??:?:
??:?:	?:: : :  : : @:@:
??:?:
??:?:	?:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
:  : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:&	"
 
_output_shapes
:
??:!


_output_shapes	
:?:%!

_output_shapes
:	?: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
:  : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:% !

_output_shapes
:	?: !

_output_shapes
::,"(
&
_output_shapes
: : #

_output_shapes
: :,$(
&
_output_shapes
:  : %

_output_shapes
: :,&(
&
_output_shapes
: @: '

_output_shapes
:@:&("
 
_output_shapes
:
??:!)

_output_shapes	
:?:&*"
 
_output_shapes
:
??:!+

_output_shapes	
:?:%,!

_output_shapes
:	?: -

_output_shapes
::.

_output_shapes
: 
?
e
F__inference_dropout_26_layer_call_and_return_conditional_losses_873568

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UU??2
dropout/Const{
dropout/MulMulinputsdropout/Const:output:0*
T0*/
_output_shapes
:????????? 2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*/
_output_shapes
:????????? *
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???>2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*/
_output_shapes
:????????? 2
dropout/GreaterEqual?
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*/
_output_shapes
:????????? 2
dropout/Cast?
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*/
_output_shapes
:????????? 2
dropout/Mul_1m
IdentityIdentitydropout/Mul_1:z:0*
T0*/
_output_shapes
:????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? :W S
/
_output_shapes
:????????? 
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
[
rescaling_19_inputE
$serving_default_rescaling_19_input:0???????????<
dense_400
StatefulPartitionedCall:0?????????tensorflow/serving/predict:??
?d
layer-0
layer_with_weights-0
layer-1
layer-2
layer-3
layer_with_weights-1
layer-4
layer-5
layer-6
layer_with_weights-2
layer-7
	layer-8

layer-9
layer-10
layer_with_weights-3
layer-11
layer_with_weights-4
layer-12
layer_with_weights-5
layer-13
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api

signatures
?_default_save_signature
+?&call_and_return_all_conditional_losses
?__call__"?`
_tf_keras_sequential?_{"name": "sequential_19", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "class_name": "Sequential", "config": {"name": "sequential_19", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 150, 150, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "rescaling_19_input"}}, {"class_name": "Rescaling", "config": {"name": "rescaling_19", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 150, 150, 3]}, "dtype": "float32", "scale": 0.00392156862745098, "offset": 0.0}}, {"class_name": "Conv2D", "config": {"name": "conv2d_41", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "same", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_41", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [4, 4]}, "data_format": "channels_last"}}, {"class_name": "Dropout", "config": {"name": "dropout_25", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}}, {"class_name": "Conv2D", "config": {"name": "conv2d_42", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_42", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [3, 3]}, "data_format": "channels_last"}}, {"class_name": "Dropout", "config": {"name": "dropout_26", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}}, {"class_name": "Conv2D", "config": {"name": "conv2d_43", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_43", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}}, {"class_name": "Dropout", "config": {"name": "dropout_27", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}}, {"class_name": "Flatten", "config": {"name": "flatten_19", "trainable": true, "dtype": "float32", "data_format": "channels_last"}}, {"class_name": "Dense", "config": {"name": "dense_38", "trainable": true, "dtype": "float32", "units": 256, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "dense_39", "trainable": true, "dtype": "float32", "units": 128, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "dense_40", "trainable": true, "dtype": "float32", "units": 6, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}]}, "shared_object_id": 27, "build_input_shape": {"class_name": "TensorShape", "items": [null, 150, 150, 3]}, "is_graph_network": true, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 150, 150, 3]}, "float32", "rescaling_19_input"]}, "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "Sequential", "config": {"name": "sequential_19", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 150, 150, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "rescaling_19_input"}, "shared_object_id": 0}, {"class_name": "Rescaling", "config": {"name": "rescaling_19", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 150, 150, 3]}, "dtype": "float32", "scale": 0.00392156862745098, "offset": 0.0}, "shared_object_id": 1}, {"class_name": "Conv2D", "config": {"name": "conv2d_41", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "same", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 2}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 3}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 4}, {"class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_41", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [4, 4]}, "data_format": "channels_last"}, "shared_object_id": 5}, {"class_name": "Dropout", "config": {"name": "dropout_25", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}, "shared_object_id": 6}, {"class_name": "Conv2D", "config": {"name": "conv2d_42", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 7}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 8}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 9}, {"class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_42", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [3, 3]}, "data_format": "channels_last"}, "shared_object_id": 10}, {"class_name": "Dropout", "config": {"name": "dropout_26", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}, "shared_object_id": 11}, {"class_name": "Conv2D", "config": {"name": "conv2d_43", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 12}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 13}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 14}, {"class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_43", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "shared_object_id": 15}, {"class_name": "Dropout", "config": {"name": "dropout_27", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}, "shared_object_id": 16}, {"class_name": "Flatten", "config": {"name": "flatten_19", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "shared_object_id": 17}, {"class_name": "Dense", "config": {"name": "dense_38", "trainable": true, "dtype": "float32", "units": 256, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 18}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 19}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 20}, {"class_name": "Dense", "config": {"name": "dense_39", "trainable": true, "dtype": "float32", "units": 128, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 21}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 22}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 23}, {"class_name": "Dense", "config": {"name": "dense_40", "trainable": true, "dtype": "float32", "units": 6, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 24}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 25}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 26}]}}, "training_config": {"loss": {"class_name": "SparseCategoricalCrossentropy", "config": {"reduction": "auto", "name": "sparse_categorical_crossentropy", "from_logits": false}, "shared_object_id": 28}, "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "accuracy", "dtype": "float32", "fn": "sparse_categorical_accuracy"}, "shared_object_id": 29}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.0010000000474974513, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
?
	keras_api"?
_tf_keras_layer?{"name": "rescaling_19", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, 150, 150, 3]}, "stateful": false, "must_restore_from_config": true, "class_name": "Rescaling", "config": {"name": "rescaling_19", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 150, 150, 3]}, "dtype": "float32", "scale": 0.00392156862745098, "offset": 0.0}, "shared_object_id": 1}
?


kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?	
_tf_keras_layer?	{"name": "conv2d_41", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv2D", "config": {"name": "conv2d_41", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "same", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 2}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 3}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 4, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 3}}, "shared_object_id": 30}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 150, 150, 3]}}
?
	variables
trainable_variables
regularization_losses
	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "max_pooling2d_41", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_41", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [4, 4]}, "data_format": "channels_last"}, "shared_object_id": 5, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 31}}
?
 	variables
!trainable_variables
"regularization_losses
#	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dropout_25", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dropout", "config": {"name": "dropout_25", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}, "shared_object_id": 6}
?


$kernel
%bias
&	variables
'trainable_variables
(regularization_losses
)	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?	
_tf_keras_layer?	{"name": "conv2d_42", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv2D", "config": {"name": "conv2d_42", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 7}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 8}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 9, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 32}}, "shared_object_id": 32}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 37, 37, 32]}}
?
*	variables
+trainable_variables
,regularization_losses
-	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "max_pooling2d_42", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_42", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [3, 3]}, "data_format": "channels_last"}, "shared_object_id": 10, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 33}}
?
.	variables
/trainable_variables
0regularization_losses
1	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dropout_26", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dropout", "config": {"name": "dropout_26", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}, "shared_object_id": 11}
?


2kernel
3bias
4	variables
5trainable_variables
6regularization_losses
7	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?	
_tf_keras_layer?	{"name": "conv2d_43", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv2D", "config": {"name": "conv2d_43", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 12}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 13}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 14, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 32}}, "shared_object_id": 34}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 11, 11, 32]}}
?
8	variables
9trainable_variables
:regularization_losses
;	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "max_pooling2d_43", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "MaxPooling2D", "config": {"name": "max_pooling2d_43", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "shared_object_id": 15, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 35}}
?
<	variables
=trainable_variables
>regularization_losses
?	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dropout_27", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dropout", "config": {"name": "dropout_27", "trainable": true, "dtype": "float32", "rate": 0.4, "noise_shape": null, "seed": null}, "shared_object_id": 16}
?
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "flatten_19", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Flatten", "config": {"name": "flatten_19", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "shared_object_id": 17, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 1, "axes": {}}, "shared_object_id": 36}}
?

Dkernel
Ebias
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dense_38", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense_38", "trainable": true, "dtype": "float32", "units": 256, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 18}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 19}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 20, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 1024}}, "shared_object_id": 37}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 1024]}}
?

Jkernel
Kbias
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dense_39", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense_39", "trainable": true, "dtype": "float32", "units": 128, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 21}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 22}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 23, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 256}}, "shared_object_id": 38}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256]}}
?

Pkernel
Qbias
R	variables
Strainable_variables
Tregularization_losses
U	keras_api
+?&call_and_return_all_conditional_losses
?__call__"?
_tf_keras_layer?{"name": "dense_40", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense_40", "trainable": true, "dtype": "float32", "units": 6, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 24}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 25}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 26, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 128}}, "shared_object_id": 39}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 128]}}
?
Viter

Wbeta_1

Xbeta_2
	Ydecay
Zlearning_ratem?m?$m?%m?2m?3m?Dm?Em?Jm?Km?Pm?Qm?v?v?$v?%v?2v?3v?Dv?Ev?Jv?Kv?Pv?Qv?"
	optimizer
v
0
1
$2
%3
24
35
D6
E7
J8
K9
P10
Q11"
trackable_list_wrapper
v
0
1
$2
%3
24
35
D6
E7
J8
K9
P10
Q11"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables
[layer_regularization_losses
\metrics
]layer_metrics

^layers
_non_trainable_variables
trainable_variables
regularization_losses
?__call__
?_default_save_signature
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
-
?serving_default"
signature_map
"
_generic_user_object
*:( 2conv2d_41/kernel
: 2conv2d_41/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables
`layer_regularization_losses
ametrics
blayer_metrics

clayers
dnon_trainable_variables
trainable_variables
regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
	variables
elayer_regularization_losses
fmetrics
glayer_metrics

hlayers
inon_trainable_variables
trainable_variables
regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
 	variables
jlayer_regularization_losses
kmetrics
llayer_metrics

mlayers
nnon_trainable_variables
!trainable_variables
"regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
*:(  2conv2d_42/kernel
: 2conv2d_42/bias
.
$0
%1"
trackable_list_wrapper
.
$0
%1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
&	variables
olayer_regularization_losses
pmetrics
qlayer_metrics

rlayers
snon_trainable_variables
'trainable_variables
(regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
*	variables
tlayer_regularization_losses
umetrics
vlayer_metrics

wlayers
xnon_trainable_variables
+trainable_variables
,regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
.	variables
ylayer_regularization_losses
zmetrics
{layer_metrics

|layers
}non_trainable_variables
/trainable_variables
0regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
*:( @2conv2d_43/kernel
:@2conv2d_43/bias
.
20
31"
trackable_list_wrapper
.
20
31"
trackable_list_wrapper
 "
trackable_list_wrapper
?
4	variables
~layer_regularization_losses
metrics
?layer_metrics
?layers
?non_trainable_variables
5trainable_variables
6regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
8	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
9trainable_variables
:regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
<	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
=trainable_variables
>regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
@	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Atrainable_variables
Bregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
#:!
??2dense_38/kernel
:?2dense_38/bias
.
D0
E1"
trackable_list_wrapper
.
D0
E1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
F	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Gtrainable_variables
Hregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
#:!
??2dense_39/kernel
:?2dense_39/bias
.
J0
K1"
trackable_list_wrapper
.
J0
K1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
L	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Mtrainable_variables
Nregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
": 	?2dense_40/kernel
:2dense_40/bias
.
P0
Q1"
trackable_list_wrapper
.
P0
Q1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
R	variables
 ?layer_regularization_losses
?metrics
?layer_metrics
?layers
?non_trainable_variables
Strainable_variables
Tregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 "
trackable_list_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_dict_wrapper
?
0
1
2
3
4
5
6
7
	8

9
10
11
12
13"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?

?total

?count
?	variables
?	keras_api"?
_tf_keras_metric?{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 40}
?

?total

?count
?
_fn_kwargs
?	variables
?	keras_api"?
_tf_keras_metric?{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "sparse_categorical_accuracy"}, "shared_object_id": 29}
:  (2total
:  (2count
0
?0
?1"
trackable_list_wrapper
.
?	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
.
?	variables"
_generic_user_object
/:- 2Adam/conv2d_41/kernel/m
!: 2Adam/conv2d_41/bias/m
/:-  2Adam/conv2d_42/kernel/m
!: 2Adam/conv2d_42/bias/m
/:- @2Adam/conv2d_43/kernel/m
!:@2Adam/conv2d_43/bias/m
(:&
??2Adam/dense_38/kernel/m
!:?2Adam/dense_38/bias/m
(:&
??2Adam/dense_39/kernel/m
!:?2Adam/dense_39/bias/m
':%	?2Adam/dense_40/kernel/m
 :2Adam/dense_40/bias/m
/:- 2Adam/conv2d_41/kernel/v
!: 2Adam/conv2d_41/bias/v
/:-  2Adam/conv2d_42/kernel/v
!: 2Adam/conv2d_42/bias/v
/:- @2Adam/conv2d_43/kernel/v
!:@2Adam/conv2d_43/bias/v
(:&
??2Adam/dense_38/kernel/v
!:?2Adam/dense_38/bias/v
(:&
??2Adam/dense_39/kernel/v
!:?2Adam/dense_39/bias/v
':%	?2Adam/dense_40/kernel/v
 :2Adam/dense_40/bias/v
?2?
!__inference__wrapped_model_873270?
???
FullArgSpec
args? 
varargsjargs
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *;?8
6?3
rescaling_19_input???????????
?2?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873931
I__inference_sequential_19_layer_call_and_return_conditional_losses_874010
I__inference_sequential_19_layer_call_and_return_conditional_losses_873791
I__inference_sequential_19_layer_call_and_return_conditional_losses_873836?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
.__inference_sequential_19_layer_call_fn_873479
.__inference_sequential_19_layer_call_fn_874039
.__inference_sequential_19_layer_call_fn_874068
.__inference_sequential_19_layer_call_fn_873746?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
E__inference_conv2d_41_layer_call_and_return_conditional_losses_874079?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
*__inference_conv2d_41_layer_call_fn_874088?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_873276?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *@?=
;?84????????????????????????????????????
?2?
1__inference_max_pooling2d_41_layer_call_fn_873282?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *@?=
;?84????????????????????????????????????
?2?
F__inference_dropout_25_layer_call_and_return_conditional_losses_874093
F__inference_dropout_25_layer_call_and_return_conditional_losses_874105?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
+__inference_dropout_25_layer_call_fn_874110
+__inference_dropout_25_layer_call_fn_874115?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
E__inference_conv2d_42_layer_call_and_return_conditional_losses_874126?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
*__inference_conv2d_42_layer_call_fn_874135?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_873288?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *@?=
;?84????????????????????????????????????
?2?
1__inference_max_pooling2d_42_layer_call_fn_873294?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *@?=
;?84????????????????????????????????????
?2?
F__inference_dropout_26_layer_call_and_return_conditional_losses_874140
F__inference_dropout_26_layer_call_and_return_conditional_losses_874152?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
+__inference_dropout_26_layer_call_fn_874157
+__inference_dropout_26_layer_call_fn_874162?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
E__inference_conv2d_43_layer_call_and_return_conditional_losses_874173?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
*__inference_conv2d_43_layer_call_fn_874182?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_873300?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *@?=
;?84????????????????????????????????????
?2?
1__inference_max_pooling2d_43_layer_call_fn_873306?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *@?=
;?84????????????????????????????????????
?2?
F__inference_dropout_27_layer_call_and_return_conditional_losses_874187
F__inference_dropout_27_layer_call_and_return_conditional_losses_874199?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
+__inference_dropout_27_layer_call_fn_874204
+__inference_dropout_27_layer_call_fn_874209?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
F__inference_flatten_19_layer_call_and_return_conditional_losses_874215?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
+__inference_flatten_19_layer_call_fn_874220?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_dense_38_layer_call_and_return_conditional_losses_874231?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_dense_38_layer_call_fn_874240?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_dense_39_layer_call_and_return_conditional_losses_874251?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_dense_39_layer_call_fn_874260?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_dense_40_layer_call_and_return_conditional_losses_874271?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_dense_40_layer_call_fn_874280?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
$__inference_signature_wrapper_873873rescaling_19_input"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
!__inference__wrapped_model_873270?$%23DEJKPQE?B
;?8
6?3
rescaling_19_input???????????
? "3?0
.
dense_40"?
dense_40??????????
E__inference_conv2d_41_layer_call_and_return_conditional_losses_874079p9?6
/?,
*?'
inputs???????????
? "/?,
%?"
0??????????? 
? ?
*__inference_conv2d_41_layer_call_fn_874088c9?6
/?,
*?'
inputs???????????
? ""???????????? ?
E__inference_conv2d_42_layer_call_and_return_conditional_losses_874126l$%7?4
-?*
(?%
inputs?????????%% 
? "-?*
#? 
0?????????## 
? ?
*__inference_conv2d_42_layer_call_fn_874135_$%7?4
-?*
(?%
inputs?????????%% 
? " ??????????## ?
E__inference_conv2d_43_layer_call_and_return_conditional_losses_874173l237?4
-?*
(?%
inputs????????? 
? "-?*
#? 
0?????????		@
? ?
*__inference_conv2d_43_layer_call_fn_874182_237?4
-?*
(?%
inputs????????? 
? " ??????????		@?
D__inference_dense_38_layer_call_and_return_conditional_losses_874231^DE0?-
&?#
!?
inputs??????????
? "&?#
?
0??????????
? ~
)__inference_dense_38_layer_call_fn_874240QDE0?-
&?#
!?
inputs??????????
? "????????????
D__inference_dense_39_layer_call_and_return_conditional_losses_874251^JK0?-
&?#
!?
inputs??????????
? "&?#
?
0??????????
? ~
)__inference_dense_39_layer_call_fn_874260QJK0?-
&?#
!?
inputs??????????
? "????????????
D__inference_dense_40_layer_call_and_return_conditional_losses_874271]PQ0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????
? }
)__inference_dense_40_layer_call_fn_874280PPQ0?-
&?#
!?
inputs??????????
? "???????????
F__inference_dropout_25_layer_call_and_return_conditional_losses_874093l;?8
1?.
(?%
inputs?????????%% 
p 
? "-?*
#? 
0?????????%% 
? ?
F__inference_dropout_25_layer_call_and_return_conditional_losses_874105l;?8
1?.
(?%
inputs?????????%% 
p
? "-?*
#? 
0?????????%% 
? ?
+__inference_dropout_25_layer_call_fn_874110_;?8
1?.
(?%
inputs?????????%% 
p 
? " ??????????%% ?
+__inference_dropout_25_layer_call_fn_874115_;?8
1?.
(?%
inputs?????????%% 
p
? " ??????????%% ?
F__inference_dropout_26_layer_call_and_return_conditional_losses_874140l;?8
1?.
(?%
inputs????????? 
p 
? "-?*
#? 
0????????? 
? ?
F__inference_dropout_26_layer_call_and_return_conditional_losses_874152l;?8
1?.
(?%
inputs????????? 
p
? "-?*
#? 
0????????? 
? ?
+__inference_dropout_26_layer_call_fn_874157_;?8
1?.
(?%
inputs????????? 
p 
? " ?????????? ?
+__inference_dropout_26_layer_call_fn_874162_;?8
1?.
(?%
inputs????????? 
p
? " ?????????? ?
F__inference_dropout_27_layer_call_and_return_conditional_losses_874187l;?8
1?.
(?%
inputs?????????@
p 
? "-?*
#? 
0?????????@
? ?
F__inference_dropout_27_layer_call_and_return_conditional_losses_874199l;?8
1?.
(?%
inputs?????????@
p
? "-?*
#? 
0?????????@
? ?
+__inference_dropout_27_layer_call_fn_874204_;?8
1?.
(?%
inputs?????????@
p 
? " ??????????@?
+__inference_dropout_27_layer_call_fn_874209_;?8
1?.
(?%
inputs?????????@
p
? " ??????????@?
F__inference_flatten_19_layer_call_and_return_conditional_losses_874215a7?4
-?*
(?%
inputs?????????@
? "&?#
?
0??????????
? ?
+__inference_flatten_19_layer_call_fn_874220T7?4
-?*
(?%
inputs?????????@
? "????????????
L__inference_max_pooling2d_41_layer_call_and_return_conditional_losses_873276?R?O
H?E
C?@
inputs4????????????????????????????????????
? "H?E
>?;
04????????????????????????????????????
? ?
1__inference_max_pooling2d_41_layer_call_fn_873282?R?O
H?E
C?@
inputs4????????????????????????????????????
? ";?84?????????????????????????????????????
L__inference_max_pooling2d_42_layer_call_and_return_conditional_losses_873288?R?O
H?E
C?@
inputs4????????????????????????????????????
? "H?E
>?;
04????????????????????????????????????
? ?
1__inference_max_pooling2d_42_layer_call_fn_873294?R?O
H?E
C?@
inputs4????????????????????????????????????
? ";?84?????????????????????????????????????
L__inference_max_pooling2d_43_layer_call_and_return_conditional_losses_873300?R?O
H?E
C?@
inputs4????????????????????????????????????
? "H?E
>?;
04????????????????????????????????????
? ?
1__inference_max_pooling2d_43_layer_call_fn_873306?R?O
H?E
C?@
inputs4????????????????????????????????????
? ";?84?????????????????????????????????????
I__inference_sequential_19_layer_call_and_return_conditional_losses_873791?$%23DEJKPQM?J
C?@
6?3
rescaling_19_input???????????
p 

 
? "%?"
?
0?????????
? ?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873836?$%23DEJKPQM?J
C?@
6?3
rescaling_19_input???????????
p

 
? "%?"
?
0?????????
? ?
I__inference_sequential_19_layer_call_and_return_conditional_losses_873931x$%23DEJKPQA?>
7?4
*?'
inputs???????????
p 

 
? "%?"
?
0?????????
? ?
I__inference_sequential_19_layer_call_and_return_conditional_losses_874010x$%23DEJKPQA?>
7?4
*?'
inputs???????????
p

 
? "%?"
?
0?????????
? ?
.__inference_sequential_19_layer_call_fn_873479w$%23DEJKPQM?J
C?@
6?3
rescaling_19_input???????????
p 

 
? "???????????
.__inference_sequential_19_layer_call_fn_873746w$%23DEJKPQM?J
C?@
6?3
rescaling_19_input???????????
p

 
? "???????????
.__inference_sequential_19_layer_call_fn_874039k$%23DEJKPQA?>
7?4
*?'
inputs???????????
p 

 
? "???????????
.__inference_sequential_19_layer_call_fn_874068k$%23DEJKPQA?>
7?4
*?'
inputs???????????
p

 
? "???????????
$__inference_signature_wrapper_873873?$%23DEJKPQ[?X
? 
Q?N
L
rescaling_19_input6?3
rescaling_19_input???????????"3?0
.
dense_40"?
dense_40?????????