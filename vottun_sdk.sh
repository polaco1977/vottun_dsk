## Cargar la configuración: source ./vottun_sdk.sh

#!/bin/bash

## FUNCION AYUDA SDK
ayuda() {

echo "Funciones: <ayuda> <deploy_erc20> <total_supply> <symbol> <name> <increase_allowance> <allowance> <transfer_from>"
echo "Nota: Las comillas dobles se deben utilizar en las variables donde el valor contenga espacio o caracteres especiales. Caso contrario no es necesario su uso."
echo "deploy_erc20 \"name\" \"symbol\" \"alias\" initialSupply network gasLimit"
echo ""
echo "deploy_erc20 \"420CATS\" \"420C\" \"420 TOKEN\" 10000000000000000000 80001 6000000" 
echo ""
echo "total_supply contractAddress network"
echo "total_supply 0x8D5288443fC204d9e54A34B8BB0B10801542D1ba 80001"
echo "symbol contractAddress network"
echo "symbol 0x9f6bAa3d02900458e0CEb07406eF03EfbA6001F5 80001"
echo "name contractAddress network"
echo "name 0x9f6bAa3d02900458e0CEb07406eF03EfbA6001F5 80001"
echo "increase_allowance contractAddress spender network gasLimit addedValue(WEI)"
echo "increase_allowance 0x9f6bAa3d02900458e0CEb07406eF03EfbA6001F5 0x02f048c00fd73ad1e74b1b8d5c3c29d4643b63a2 80001 6000000 3000000000000"
echo "allowance contractAddress network owner spender"
echo "allowance 0x9f6bAa3d02900458e0CEb07406eF03EfbA6001F5 80001 0x02f048c00fd73ad1e74b1b8d5c3c29d4643b63a2 0x02f048c00fd73ad1e74b1b8d5c3c29d4643b63a2"
echo "transfer_from contractAddress sender recipient network amount(WEI) gasLimit"
echo "transfer_from 0x9f6bAa3d02900458e0CEb07406eF03EfbA6001F5 0x02f048c00fd73ad1e74b1b8d5c3c29d4643b63a2 0x7F06A3D6A1E3Adc9Fe9FA50Be3fB88bFD66efc3B 80001 2000000000000 6000000"
}

## FUNCION DEPLOY CONTRATO ERC20
deploy_erc20() {

local name="$1"
local symbol="$2"
local alias="$3"
local initialSupply="$4"
local network="$5"
local gasLimit="$6"

## FUNCION DEPLOY CONTRATO ERC20

curl --location 'https://api.vottun.tech/erc/v1/erc20/deploy' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "name": "'"$name"'",
    "symbol": "'"$symbol"'",
    "alias": "'"$alias"'",
    "initialSupply": '$initialSupply',
    "network": '$network',
    "gasLimit": '$gasLimit'
}'
}

## FUNCION TOTAL SUPPLY DE UN TOKEN
total_supply() {

local contractAddress="$1"
local network="$2"

curl --location 'https://api.vottun.tech/erc/v1/erc20/totalSupply' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "contractAddress": "'"$contractAddress"'",
    "network": '$network'
}'
}

## FUNCION SYMBOL
symbol() {
local contractAddress="$1"
local network="$2"

curl --location 'https://api.vottun.tech/erc/v1/erc20/symbol' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "contractAddress": "'"$contractAddress"'",
    "network": '$network'
}'
}

## FUNCION NAME
name() {
local contractAddress="$1"
local network="$2"

curl --location 'https://api.vottun.tech/erc/v1/erc20/name' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "contractAddress": "'"$contractAddress"'",
    "network": '$network'
}'
}

## FUNCION INCREASE ALLOWANCE
increase_allowance() {
local contractAddress="$1"
local spender="$2"
local network="$3"
local gasLimit="$4"
local addedValue="$5"

curl --location 'https://api.vottun.tech/erc/v1/erc20/increaseAllowance' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "contractAddress": "'"$contractAddress"'",
    "spender": "'"$spender"'",
    "network": '$network',
    "gasLimit": '$gasLimit',
    "addedValue": '$addedValue'
}'
}

## FUNCION ALLOWANCE
allowance() {
local contractAddress="$1"
local network="$2"
local owner="$3"
local spender="$4"
curl --location --request GET 'https://api.vottun.tech/erc/v1/erc20/allowance' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "contractAddress": "'"$contractAddress"'",
    "network": '$network',
    "owner": "'"$owner"'",
    "spender": "'"$spender"'"
}'
}

## FUNCION TRANFER_FROM
transfer_from() {
local contractAddress="$1"
local sender="$2"
local recipient="$3"
local network="$4"
local amount="$5"
local gasLimit="$6"

curl --location 'https://api.vottun.tech/erc/v1/erc20/transferFrom' \
--header 'x-application-vkn: ZoFp1ZTO4IW-I11f63msiOkf4fT8BSHYbsfGf-AXYJ-QY38q6h_MqlCPM-s0qCSJ' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyY2R1UVQ3MkptdGw0RldHWjhuNXNEdVlTZDciLCJ0eXBlIjoiZXJwIiwiaWQiOiIiLCJ1c2VybmFtZSI6InBvbGFjbzE5NzdAcHJvdG9ubWFpbC5jb20iLCJjaWQiOiI0MzZlODkwNC01N2UyLTRhZDgtOTgxMS02YTFjNmUwNjAwYWQiLCJza3UiOlt7InIiOjExLCJzIjo4LCJlIjowfSx7InIiOjExLCJzIjo4MDAxLCJlIjowfV0sInB1YyI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCJ9.XdTk_Ii-TYyX07e7ULCjuDJeF4GjI4lgQpQUhCeOFCOPaFtraabHYgAhL4cO1WXeZ7yFeaJpvNcXMaEifadzXf9dof1XzEDEBTVlW0OjcZWcevW6tTTWm9TfIzxS3WT977Idz4VZpzhJFZZHZ4RtBbSPvRr3ubxwunbP14FXgmquPVJbWakuDI2XaSs-5N-xbplJrRN34eMUvayiHcpV2jz89I2vCgyEaKfxDM71z2skCNVJyIO7cH_0dcnxsFTgd05UfCv9Jh4ZArVrbOYqM77gZck8gpBtxTXydMJrhGnTOfXGO9ItvUanoosCNJpeBAZyZl0o-_DZY8KHtMS6U3_TTyjTp1gxBnG_Iu3dYjTHHUMWspXJbxlbH_u53-EDkrNTfP1eVnreHi9NPudhVAySTeM-nRGygSkn4Pcw2HorpbPPjy2Sh4-c02lH4rY7mDaQo-QN_CcdmdcSz0Cdi2nE4nx3BLEdjS3IVIvH27Ym_IO2dYLYWnrTUFMZMtbj9xuDE-UiDszCPLU1Ej39j4Y6SZpymjIVJYuwi-neh432_M_7PkLWcojLrJhV9nESGSZO7rgKdTPHltiAnV-wUijK-QQMvGae8AkjVA1HHc4jPOWwF0-s8MPS903jXUasocaXx-u7pCnTZpSffoILnumArR-nVk6NG3YbB7kppdU' \
--data '{
    "contractAddress": "'"$contractAddress"'",
    "sender": "'"$sender"'",
    "recipient": "'"$recipient"'",
    "network": '$network',
    "amount": '$amount',
    "gasLimit": '$gasLimit'
}'
}