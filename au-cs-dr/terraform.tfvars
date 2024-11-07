// account and region details
account_id = "014498633891"
region = "ap-southeast-2"

// tag details
env = "dr"
prj = "au-learning"
cst = "au-learning"
owner = "CloudOps"

// VPC details
vpc_name = "au-learning-cs-dr-vpc"
cidr_range = "10.151.64.0/19"
public_subnet_1 = "au-learning-dr-public-subnet-2a"
public_subnet_1_cidr_range = "10.151.1.0/24"
public_subnet_1_availability_zone = "ap-southeast-2a"
public_subnet_2 = "au-learning-dr-public-subnet-2b"
public_subnet_2_cidr_range = "10.151.2.0/24"
public_subnet_2_availability_zone = "ap-southeast-2b"
private_subnet_1 = "au-learning-dr-private-subnet-2a"
private_subnet_1_cidr_range = "10.151.3.0/24"
private_subnet_1_availability_zone = "ap-southeast-2a"
private_subnet_2 = "au-learning-dr-private-subnet-2b"
private_subnet_2_cidr_range = "10.151.4.0/24"
private_subnet_2_availability_zone = "ap-southeast-2b"
IGW_name = "au-learning-dr-igw"
public_rt = "au-learning-dr-public-rt"
EIP_name = "au-learning-dr-NAT-EIP"
NAT_gateway_name = "au-learning-dr-nat-gw"
private_rt = "au-learning-dr-private-rt"
NACL_name = "au-learning-dr-NACL"

// CS cluster details
cluster-name = "au-learning-dr-cs-cluster"
nodegroup-name = "au-learning-dr-cs-cluster-nodegroup"
cluster-role = "au-learning-dr-cs-cluster-role"
nodegroup-role = "au-learning-dr-cs-cluster-nodegroup-role"
dr-key = "au-learning-cs-dr"