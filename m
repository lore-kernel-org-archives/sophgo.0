Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1293D23C4E5
	for <sophgo@lists.linux.dev>; Wed, 23 Jul 2025 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254817; cv=fail; b=kV2U+GhOAoW6jI9cij/pFvRAT6cXcWIzv7yICQeNGwkey831bR4MuSy/nFVj0hxFDZYW+1RpvUgDqCOZhczhvL7JwiTdHZBiROFfCkFTdua8WElUf9Ko0A8ioPud3l0c/ZqGtr7pSmPSAQSbx+cJce7huSbuqK6H8EXsTJylbCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254817; c=relaxed/simple;
	bh=RVwMo0B4hSnWm85BQjabV2HkXV5h990n0SOdF9eVdaE=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=RU3wy21gPOR2+ieoea16dYW7M1N6kzA/kiiX+K259XgZXbWgskkx/5ymR6G4HO2A07GxVWyktMQpPfu8gqp5LQmLEkPiqyClGkQ1E9fQW6uW8kY+ToAGeItxZ8d797k6ZmdmJs89ldX5yKX1V3DoCezKziJoRPw0PvCVEAL08fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WuUpnp3A; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WuUpnp3A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5POzGhvErc0ztjbZwVjFXH74PIhGuYpvqIwpjMCQSY9Jj5NkJb6jcnXD4YutKZjJ8XqR1eYNIN26xBU/2rXQSAzM3icuLCotvNplfomIkOSzotaoN+DBD2LvLIw0Zyhbf3DzoSbN0GxDaU0bD1+Dh4hT5Ib3xdwhtOAn+CcTrbBNiFasYPp31rA0p4ZfsXdlR+SB4jA6dSelFULDebIsi279AbvDOS+Y9/ilynRyHxmtds9MnogJXOe7+GglvxnLY4Dsaeq/l1kJDoLPojRG6lG1N5/fJMT+K7kmWVq0D38DoZUzDK3X7IZ7hw18QNPkuj04LkGdzcy3JDTbSF9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flJpbWwZ9/PoiqKSOO3H+5um8jfacUGvWZFBrrKx8dU=;
 b=AXQlvHoTgMgnFSgOTpa1fnUNGuV0XptVpTUlzbeSB+N8yk7hRAtHrVs7LNYf54muR1zoiM1bsRwLJf9GcqXXIpOt5M+A5NWaKSh6wWCgwpwYi7w/07oedQiwVw0PZ6T6p+wkGPSsQl9BYg02HomxIKAyUXrb8HsdtLXAr4nWuIk8qEZX9pmmwaKdKt2LJvWAJcXjDJkPeszzH0+RwXgxvjKf2k4HWTT9XC0PLiGrI9Xoelw99AVFNmfgC7PVjYFhxTw5Rnrr26TSCQ1R8SYBp5ZZfLVHLwfgrDOF3mXvageRsdCCZtP+pn6O5M0CWmCDdm/XFOTGDR+GsVub2b3gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flJpbWwZ9/PoiqKSOO3H+5um8jfacUGvWZFBrrKx8dU=;
 b=WuUpnp3AAdDHla/StydkaokE3Sj/jUnJbMT5N2l3AYv/lWr5iA8tL6Lj3vum8BfQwVbND5LQxcBoHS/T4YABVA2KW0aQxPrZiDU+7hCJ9Qzu73eJQG2k/UHKtLF8hAoi07GfYwiWjft0mmJC4+CeTogkXL0HPgYxE/7HZ325Qol9IppSsROeUZiSKOiRKiOwTZ9HcTmuwqdx9EuK+iWFYo8uY4SjjLNWqVJei27qaKwngE4QcArSuvjDvrwvRHjxOwjaKWNhcjxHy2F8QLzqwE91f5+8pjZGGyiXlPHCAx5OnQOCpurYiH6+2G7gUfILEp1+L2DLF14HtytLIf08Lg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAZPR01MB6213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:4c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 07:13:27 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 07:13:27 +0000
Message-ID:
 <MAUPR01MB1107297124C9DA0CD77DA3DC1FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 23 Jul 2025 15:13:21 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <b5e353ed-25f6-4cef-a214-49c999d97c30@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAZPR01MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 6690f593-5d4e-49ab-9f95-08ddc9b86b8c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|19110799012|461199028|6090799003|5062599005|8060799015|440099028|51005399003|40105399003|3412199025|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHpFM1lWYkpwUmp1MWExWVhHdVNzdHI3U0ZTSmlMVzcyYTBWQ3M2ek5aT3VS?=
 =?utf-8?B?cjBrTTluN3pjQUQ2ZTZmUlpZNllKZGhLZG1PYWlBOWJ3MnFHKzZRL016dWJ2?=
 =?utf-8?B?UHE0NkNaUnBDR3VVUXV4U1EzcUFTa1ZyamZSaEFvWkVRWjkvVEM5alBHK3dG?=
 =?utf-8?B?TzFhbUZHYk9pYVZxYkZVWGNJQVhnYklCWFlLRENQUUdvaWQ0SnQyRDR1ckl5?=
 =?utf-8?B?YVlQM1c3QXhLT0N3emhVc2FicmFRV0x5dFY3a01tZzc0UDlwSDBRS1daeVkz?=
 =?utf-8?B?Y0s2M0FPSUdyeW1xWXE3N2x0YjBnRCtONExWNk9EdFpiSHUzZGszTmFKNENp?=
 =?utf-8?B?Q0dlYXJwZlJyL01tY3lTOEpTdTI5OGl5Z0dZS3VXYmpvLzkwdVd5em5hNjEx?=
 =?utf-8?B?TSttZitYR0QzcjhVRllOT1FqZlZ2VXd5L1o1L3BRZFArSnRpU2FHazc5OU1X?=
 =?utf-8?B?Qlp5WlRnUGJNb0ZKMzJjdk5LamhEa09CcHZyWURNUHRZL2ZtU1dEeTF1ZVJz?=
 =?utf-8?B?b0hzdUdMaUdsSE54OFFETlBMTjd1dlJyWVFtamxJTXpUU2ExTVA5L1ZMSGJB?=
 =?utf-8?B?NC9CNnZXcStnZW5teXRjb25IMVdieTBxcXczVWVzMVJJTXg3OWFTUUdEbWNX?=
 =?utf-8?B?ZEVicS90QnBVMzRYM0FacDBlSEF3WW5Nc21uMGp0Y3dZRDJYNmE0VzAzY1Z2?=
 =?utf-8?B?aWhQaHNSd1FvSzZKKzRUZE84eGdBMUdKV29uZ3ZhWnVXVnBlTXExS1luTU05?=
 =?utf-8?B?SDBqWWlUNGFSOWRRbHMwY2tyWjdGekQ2T3p0U2FTY2pQbWVVSktlMHRXR0hl?=
 =?utf-8?B?QVVRRlUwUlVWTGdSN2hPZSswOEJPZDN4elhaMlFEQ2p5QkFvamtreXp1bXlj?=
 =?utf-8?B?T1M0VlcvclEvOU16SVhNaEJMVksyZWVKcHF0R1FHcWZQNFRWaUN4YVV3MEdL?=
 =?utf-8?B?elZsNFdBUVRXRVJES3NpajIzcUpXeU5XYU9yenRWUS9UM2VGRk4xYzdvSFBC?=
 =?utf-8?B?S3JiaWhySzl4dklpSEQ5NkNxNk9Pcmk5NGxoRFBnUm8waXpIazFMVjNoMVI3?=
 =?utf-8?B?S0lKb251b1oxN1dQUEZZK3YxODJjUEZZSzNMV2JkL2xidGJHRXFNVXEwTE9h?=
 =?utf-8?B?a3V3cTh4VnQ4SkF3SFV2S3UrYWVrT3VxZjlWbzZsMGN3RkNOMmVLdUtoV1NE?=
 =?utf-8?B?ZjdlRzlDZ0dLLzFvNDRramo0aW5LSklzQzJlT0ZjTzlaOUEyQ0ZXOTMzVWRp?=
 =?utf-8?B?TkFJNEdkNkNlMnBqbXk5QmhIbENvYy9XZGpOUmVpREkzbFA0Zmo2REhNY2JU?=
 =?utf-8?B?Wml1dmlpMHY4YndVUXBmMnBpd0RhczdJVXBhM080aC9DS0dZays5OW8yV0E1?=
 =?utf-8?B?c2NFTkJBVFVmekxuRlF2elZKMzRXcjhVbEF0STM4L2JLSTJwa1RyODl3bWh1?=
 =?utf-8?B?Qy9HMXphcTlYb2NlRnZaNSsyNEhaRWh6cDFlRSttZkxZMm1tY2syNEVrcGRD?=
 =?utf-8?B?bi91VHFCZDY2aTU2VGg0c0dkQ0RRamxsNVVhSmt4MnBjb2JDV3pDTDViWS82?=
 =?utf-8?B?LzdlQzVPeGkzL3N2aFpFdnVmTjRBUnJibmdPSStDMDAzL0NodW9MWU9ZNk1J?=
 =?utf-8?B?RDZwRlQ2OVAwK3BONEZJZnlXZmUxdVFQWWNPYmVxM0MxODN5ODUvTWRFOExq?=
 =?utf-8?Q?Kk2sEy4gyR0wd6FW5aQX?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUt5ZGU3YWRwZENSUGhncWhHV3hUTGVxZWtsMHlLbXg5L04zQ0ppZnhSSjNZ?=
 =?utf-8?B?cW5kRzRGK1pzT2l5V1Jlbi9TWDRLelpqcU1oeEhEbXBKblgwUzBESklieFR6?=
 =?utf-8?B?Q2w2WTl3SDdHNHJzMWlIc1dwUkVMcTBqeEJnTGtzRklrRVFQMld4OXhaMTl3?=
 =?utf-8?B?cmRqL1dDL2xWQTJENktYOUFsM2VtdDNEMHdCSTNvMGwrYTg1MVI5ZklHUnY4?=
 =?utf-8?B?d2RCeWZURGQyZmh2cGJQRmhIRzFVV1Zrd0E3ajZxaDdMdXpSTnhrVVNyMmUz?=
 =?utf-8?B?bDk4bHNUV2VPS0tUREZMU3Y3cjV5TkNlamQ5cHc2VDBoVmZmTm9pMm5kZ0lx?=
 =?utf-8?B?T0I1NlAzTFRaMFJiKzM2ZWV4c2t2cVo1b0NVaHpxTDhxMGlmYTJzR1BXeFRR?=
 =?utf-8?B?ZlgxZ3czVzlaaDBmenZ0VHZKSHhob0MxNHczZWZUN0lmNE5aRTNUalB2VStK?=
 =?utf-8?B?aEdEbnZRcmx5YXk4dTNGVFJnVldqYVJjWWtDZUFyRVBpN2p4OVJxcm93SG40?=
 =?utf-8?B?NlNnd1JrSDErdXZ4cEZQdTBrZ2plY3dPRDJpcHhaR2pVVHZsN3Nwam1nQzQw?=
 =?utf-8?B?M2phZ3o4YmJEQzdISCs2WDQxTDJha3hCUStFWW03Nk9yQUdpUCtHVmNYcHVl?=
 =?utf-8?B?WmFlaDQwMklaMm9XaWs4Yy9IeERyR1ZyaUJYTW0wNmRFRVJOZEFLSTVvYWQx?=
 =?utf-8?B?L3k5WE5BZWZMa3RZbnYya3pHWmxnZnBZR2NpNG5kZFBWL3lwNDJnME5JTG1o?=
 =?utf-8?B?U29tYTJVZnVtbDZ1TE9aTU9IRTBVSVdoakV0SHJxeXVYaW02RXlGcUdLUkhw?=
 =?utf-8?B?Z3MrU1BWYnhXWEpLb21jaERUaENITGFhZW9JQVdCVVBCRUdVaVBwajB0V3hS?=
 =?utf-8?B?OTFLcnovKzkzRUdKR21QTC9ISnI5RWNoOWg2TlQrZ0x0SUR4RWZFUFpXWkVt?=
 =?utf-8?B?UVkxeXVpSzd1VENLMVhrc0pxdVR4eGx0STRRYnF6dSsvQ0EyMndGUDBCQk5C?=
 =?utf-8?B?MWszVktqcU4xUmczSTBTVUZXKzhISW5xZiswN2xuL0VabkdrM25xSkRxdFly?=
 =?utf-8?B?OE1RTUFOaWx5bnR4WGthT3NrTEJaWWxGb09FVlFtQkRDUzlIMG9WbHc3SEJr?=
 =?utf-8?B?eXhWaUlvTVdHemtBWVd5ZnB1QTFaVWxLZkkvcEZkTXpmVXBZWXRGclR3U2xF?=
 =?utf-8?B?Q29BQjhuZUZUaXoxSXJSbVBZWjdVOXJaZERxNVBZOHZuSlU5WWNNdlpOQ2hB?=
 =?utf-8?B?elZkZVZ2SVZtUFV4aTBOMEdWQTFrcjVnOW1wU2R6T3NXancrRGhmNkNKbTFR?=
 =?utf-8?B?ZHpuUnNZbzJDMTJQQll6ZzlmNzhjKzI4RW5DQ1hlUHZFakh6Mkg5TVFEZWNw?=
 =?utf-8?B?VVd0ZjEzcml3N0huVFdJeUwwNSsxbnY4Q1I4Y1p0b2lvdmxnYkNCb0tRTW1r?=
 =?utf-8?B?bzlwazZERlV4dXRwWDdhSmsxQU5KUTBrdlRlMXk4R0VCR0dublo5T3E2Yk1n?=
 =?utf-8?B?d1RsajM5WGVnUjNxL2ZNcnV4d2kwMW1uZE5TZFBIUE9hcWhWcDdvVVRGWTd1?=
 =?utf-8?B?MTl3MGlUYkxDdXNnZlZEeVJEWGpRV24zNmdzUlJwTnJXYmg2bjRiaHoxenAx?=
 =?utf-8?B?VXVIeFBEVEJmdmxJQjN6eVpvcml1SDFjdnk2NzBGMmJXcGVzN3NZU1ZNeGRo?=
 =?utf-8?B?b1YzN1dhZ21tc1Z1UlhOVjkxWTREdWZqR3JibFhKRnJCQVhGZDE0NnBqckRz?=
 =?utf-8?Q?7vC/sfI8yjxGq3H1bZDvS9yIlv8UIle5TxZcTp/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6690f593-5d4e-49ab-9f95-08ddc9b86b8c
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 07:13:27.7069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6213

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.17

for you to fetch changes up to 7f90573099e8a506a6874d691d884d7f5b77ec74:

   riscv: dts: sophgo: fix mdio node name for CV180X (2025-07-23 
09:55:16 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.17

Sophgo:

For CV18xx serials:
There are three major changes. The first is to add the
RTCSYS MFD node, which provides rich control registers
for soc power management and other rich control functions;
the second is to add the reset controller node and add
related reset properties for other peripherals; the third
is to add ethernet controller related nodes to the soc
and enable ethernet device control for HuashanPi.

For SG2042:
There are three major changes. The first is to add ISA
extensions such as xtheadvector/ziccrse/zfh for cpu cores;
the second is add ethernet controller support; the third
is add two new boards EVB_V1 & EVB_V2 which use SG2042
SoC.

For SG2044:
There are many changes. The first is to add pmu
configuration; the second is to add ISA extensions
ziccrse and add missing riscv,cbop-block-size property
for cpu cores; the third is to add more peripherals
nodes for SoC after clock controller is ready, such as
MSI/PCIe/pwm/SPI-NOR etc. This PR also add HWMON MCU
device for the sophgo-srd3-10 board and reserve uart0
node for sophgo-srd3-10 board because uart0 is already
occupied by the firmware.

This PR also moves sophgo.yaml from the riscv directory
to soc/sophgo for sharing between riscv and arm. CV18xx
SoC contains a RISC-V big core and an ARM64 big core.
Moving sophgo.yaml to a shared location will help us
add support for ARM cores to the CV18xx chip in the future.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Alexander Sverdlin (2):
       riscv: dts: sophgo: cv18xx: Add RTCSYS device node
       dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, 
add SG2000

Han Gao (7):
       riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
       riscv: dts: sophgo: add ziccrse for sg2042
       riscv: dts: sophgo: add zfh for sg2042
       riscv: dts: sophgo: sg2044: add ziccrse extension
       dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
       riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
       riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

Inochi Amaoto (21):
       riscv: dts: sophgo: sg2044: Add system controller device
       riscv: dts: sophgo: sg2044: Add clock controller device
       riscv: dts: sophgo: sg2044: Add GPIO device
       riscv: dts: sophgo: sg2044: Add I2C device
       riscv: dts: sophgo: sg2044: add DMA controller device
       riscv: dts: sophgo: sg2044: Add MMC controller device
       riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
       riscv: dts: sophgo: sg2044: Add ethernet control device
       riscv: dts: sophgo: sg2044: Add pinctrl device
       riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size 
property
       riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
       riscv: dts: sophgo: add reset configuration for Sophgo CV1800 
series SoC
       riscv: dts: sophgo: sg2044: add MSI device support for SG2044
       riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
       riscv: dts: sophgo: sg2044: add pmu configuration
       riscv: dts: sophgo: Add ethernet device for cv18xx
       riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
       riscv: dts: sophgo: Enable ethernet device for Huashan Pi
       riscv: dts: sophgo: add ethernet GMAC device for sg2042
       riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
       riscv: dts: sophgo: fix mdio node name for CV180X

Longbin Li (2):
       riscv: dts: sophgo: add SG2044 SPI NOR controller driver
       riscv: dts: sophgo: add pwm controller for SG2044

  .../bindings/{riscv => soc/sophgo}/sophgo.yaml     |   9 +-
  arch/riscv/boot/dts/sophgo/Makefile                |   2 +
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             | 110 +++++
  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |   8 +
  arch/riscv/boot/dts/sophgo/cv18xx-reset.h          |  98 ++++
  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        | 384 ++++++++++------
  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       | 245 ++++++++++
  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       | 233 ++++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  61 +++
  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 283 +++++++++---
  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |  87 ++++
  arch/riscv/boot/dts/sophgo/sg2044.dtsi             | 499 
+++++++++++++++++++++
  12 files changed, 1826 insertions(+), 193 deletions(-)
  rename Documentation/devicetree/bindings/{riscv => 
soc/sophgo}/sophgo.yaml (76%)
  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

