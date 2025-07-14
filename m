Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010008.outbound.protection.outlook.com [52.103.68.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0637160
	for <sophgo@lists.linux.dev>; Mon, 14 Jul 2025 06:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752473148; cv=fail; b=p8u5u+3O0Ix3qR3MXwQQ1+Mu/bh8kU1XlpxAT5Euf+JFatd2kO6u1dL7JUJ4vDmxV7hRvSfadRX5kJmJ6LGQI2E2W9Txp8lTsclbHY6rAQ33ZBhf86lbc6lnt2luhPGHubQVFiROgjb7KwG1j/lFNceL4oGfvc6qvNIVBDiOQMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752473148; c=relaxed/simple;
	bh=268yRlEghYbC1owR+R5oS6qQuRGjyf4T5csshcR4XG0=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=DP7qZTFyDJdO0PdpMQhaAKO8CjoyDdkoiR/ABfjgfoY95Ws9G8gnstlPsVm72BcgbtarwnlnOd6ANlkxf8Lr7g1zXBa/wWuH1ehsbUm19j3GJ9zPRNZR8tDuLeP3EV7Lwq7Ht09FksNDOVOEMfJYHKIN9oIgclhAZfqYutp+prY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QVxSUERS; arc=fail smtp.client-ip=52.103.68.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QVxSUERS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haBo9nfS/Bq6rubMrS7LuGdHqKz7JzUNQxGeniuZkbvcHs7cRIBDLzOZPXqsHeuM+ADcblUBCBVmsAhoIvFJijiVGEaqCdbneU7oAgdTFYu2qZT5TOA083vr0ltJJzxrjMvyw/s/SbTyBHN4wKRENq0lQDLyXlRf9zEkr5OlnYslreRuvbGif/Smh0PLNpvPv91qFa9knNMzvUUMtcxuOuT0eJM/tfH2jcIEE/Vm4m9u13ryXs+UF7gu7JDdsrf2Y9GUp9W2vFSf75rZtgE8dy97E/Utf7MZPKUAHABbIFuC/QPwT7Qzhr+CCmhKQK2xc+PB3jvAakhEOnBc0+NeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT9gGj+KnBk4mVeB0Tjc8Cdf1U6dlUswbP/yOtQN2EA=;
 b=Q0h/kbh6N2pIDCyP6jUYjakUS3fWnkvD2UvMq5lABjOEcX7X2bxgFlkrXkhrpQzqUYpQKJKyUHrORq79VbcqohkMGdodo/cuPSbsGvKBQl30muBlX/yjDfEKRROgmbOQLKbD7VzqA1cd4fXiCESZyIkMJ+TiNhCN10DmZBFxFgD/Qbd0xwlfDDIt1aGHXlBbbUMQSVNgZAWsuenvlh+kw1QDnghHAyhM9PjiLeI3r4ws02tukFcIYbMxKRVnkujWiDuUQsLKC2HGAa9yri6C0gwbrwpBOmrYRIx2N4VQMDgDLqb0oO4jyKequgumLBSntucH5pb2GjbqnQwsbPokug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT9gGj+KnBk4mVeB0Tjc8Cdf1U6dlUswbP/yOtQN2EA=;
 b=QVxSUERSg4tkMkxqtGPV8Opla0+4PqeX2aRt8YR8Zr4H9hetSpNKGmjO5gJVvCRJDxv+z72AJWhfGMd6E4iDWrHo3v5PpT/dEoLohrCQ1moE5ig+1J9/AIZ3F/M7jdvUrM1GQFDEZ0a7witKTrzShly9o8Em9SOINfRzhKSmQWXCble+3feJnpBrDtxKezNv+/+j9R0HTTVTp47PeOj8yJgqQ7SZ1ON0o2sHy3R54U205hZe5y4uWUXjivssztkmx+hUf0/IBy6Sp+NKD3AN8+F4SVnyMy1Ejgf9+rfrORO9Kf9S6M582rNafmpCc8PXtP0nnj4A4uPfcWVIe1LPkA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN0PR01MB9319.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:10a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 06:05:39 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 06:05:38 +0000
Message-ID:
 <MAUPR01MB11072B86FA33FAFCDA1FD2D1CFE54A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 14 Jul 2025 14:05:34 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>, unicorn_wang@outlook.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0074.apcprd02.prod.outlook.com
 (2603:1096:4:90::14) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <6eab2828-0ae9-4c11-91ff-eadcb8208fa9@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN0PR01MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bc43ca-db78-4483-175d-08ddc29c7465
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|6090799003|5072599009|461199028|15080799012|40105399003|51005399003|3412199025|440099028|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVd4SGFwNzQxQ001cXhIN2w2TTNIWnBrRkptZHVLaFIxSXVrWEdJaGVOZ3pa?=
 =?utf-8?B?azBGdnViNTNxdmprbElyQ2RxdlQ0YnR1TTZ4YlN6Y1lrbTllb3VIMGx4V1gv?=
 =?utf-8?B?R0JTSVhjN3JDU3UveEc3NnZoQ25ieFNITlQ0NDNsaHpzdEdmVGUveEpCZEVM?=
 =?utf-8?B?ODFmSldOODZZYXFZb2c0RUtmN3g2LzdzUnA1TXJROXhxWGxNV1FoVi9UcVJZ?=
 =?utf-8?B?YmZSNkxpQVEwV3Eza1VRTXAvWU92dmp0Q05kMzJpbHl4VU1UaWJBVXVKdU9P?=
 =?utf-8?B?MVgxZ2I1UjF1MVdIeVEzSjNiOC9sOGxSVUpobFpYSXliNlJ3NEhvR2YzOFFQ?=
 =?utf-8?B?TFdkZWxaRjIyYklkTmczcnNsalVXR2dNV3ZUZWJ5RThlYWJsVDlsbkRtdmhv?=
 =?utf-8?B?UlF5c2dvU2YvNFczeFo1bGowd2FqZmwzSGR5bnlKT2lNcTlUSGtUZFc5SWVr?=
 =?utf-8?B?eHJXQnZha1RoNERucUI5SE52Ukh0V1JUMWRwck8rbG5wMlcvMlVqcXZKQzk2?=
 =?utf-8?B?ZXdFejdEa3NYckx5b2tnR3UrY0R2NWlRVHdvekRTVWxkTlZkaEFMSEZQaVRv?=
 =?utf-8?B?L2FDKys3RVBRbzFCeHVpWHVvSVNIaHAvVERGM2pKektPL1dqbnY5RVROK3lw?=
 =?utf-8?B?RlJ2STNjc2FvWXhLOWNlUXIreVpHMlZYZnRHVjcvdE9YMzlPRjc3QUFYMTdX?=
 =?utf-8?B?RUxDZEpMSXUwbmNLS01IZHFJOFViV055aVhGYW9GNG1RQzJGRC9EbHNOWlhM?=
 =?utf-8?B?ZmpIVmMwM2FnNGlCRndHcm5uY08zS1RIcDZIdWRnNDc4WTIzRWR6VE5XQnNK?=
 =?utf-8?B?N29wem9vUlNab0dXOTdlQW14enhWMllRUVp6Q2M2N2xWd3VNLzAySmk1QlF1?=
 =?utf-8?B?SktNYUdxVFZNeXE5dWRrUHpiaC9Ia1h6Uk5xb1JLOElmZlBSQ2FaVG5KQkxx?=
 =?utf-8?B?blF6YndvQ1VFcVMyVTIyNndrK1VyQW9mNUxoeGVUYjJDelEvL3MwUllRWnpk?=
 =?utf-8?B?Z21qSjFibHVsM0JTSHJMbXpHeXBGbzd5OHU0dkZJZE9vZXVSN2picjc3S1dL?=
 =?utf-8?B?WVh6YVowQ3pyK3dwWjRvc0RUZWE1elJldEJCTkltMm81eEM4aHkrbS8xSU1w?=
 =?utf-8?B?aHZvUktnOTcwcThURzNTY1c0bEVPTk5WUjlTTHNwTzBTRFRmUmpBM2R1bVVU?=
 =?utf-8?B?bWRmM293allRN0xVM0MvMzBjSFpDL0pNRVI5ZU1RUVdqc3BjNGtEakhtcXkr?=
 =?utf-8?B?eHlnUjZqcHJRbXNobXg0Rm8xTUdUVkFWVVFIeHJISjd2YzlKLzR5OTIwNXl2?=
 =?utf-8?B?OERhbmt2Z1pHa243UzlMUWh5T1Y5RXdHTFdUTGNwWGdhTFUxZmVZMjZwcC9G?=
 =?utf-8?B?azVhRy9QZTNndVFybklibTZZK1V3OUE3TUpOOVUybnNSVzFIS0c5b0NCN21a?=
 =?utf-8?B?RkFlZDdaZ3BTL0FxZDMwS1pIWjZvbEpUVHlmUUcyUU4xNzhSWXI1Y1dXcnh3?=
 =?utf-8?B?MlhnOHg5WTVLTlpMUGNpcWQzSktZSyt2Q2pHS0FyQTArcEJta01JNkcrZEhQ?=
 =?utf-8?Q?UzI5TRNk4vw2rlSQHYaxcGVEV9YRBUClUqZ9Ip8X4/Qj12?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUtCam5JbTk1WmlOZ1V4VWRXUFNMTVNIOXd2UlBIcjhCNVhDb0ZSZXNUTlBi?=
 =?utf-8?B?OXBCdkZRNFRFTUQ2cCthN2YvUjg3KzFhaVgyY1FVNWJaUWZsK1JYWTMvQ2Yy?=
 =?utf-8?B?Q3llN3c0bkFIZ3FXN3hKTDBpSU0yMUIxWUk3MmN5NUw1UU5FeVljelU2VlhJ?=
 =?utf-8?B?OGdwSE0raThpeTdmV2VkbkMyWGFVVGtYdi9BaGtRVGwvNlZhd09ZNmxMbzBj?=
 =?utf-8?B?T3phUnd6bGd2TDY0TWE2V1RDS3FkTGlLQlc4clJrNEphTENPVnp5RFhXb0hH?=
 =?utf-8?B?K2JZelhpeVloWC9ZL3RyNE5qZGdhWFRxMUtDdXI1SmRqSEZPQ1lrcVhrcHpq?=
 =?utf-8?B?MzhLNHF0VW13RU9oeVFhK3hzME5WSlNzdnMvd05oSE41WktIQ2JiQWlibUh2?=
 =?utf-8?B?WlVRRTVhYlFrNjBwNHJVTmtQYjlod2d3czhPcSt4WVVURU02bHlzU0RjMlpm?=
 =?utf-8?B?akhDeU5IRDhOSGFheWQ3ZjFmMERzcU54bUdaR2hFYlBrYU44MEduakdnVHRu?=
 =?utf-8?B?UDI1c3ZKNnNNelFKeUZ3VExlSngxYi9JZTh2eWJyUURzNCtEcTJwWGNJWUc2?=
 =?utf-8?B?RVZHK2JSZFlyaFUzcGdSdERyVnhhZFY3YVZRVW5SajF3Y3hDNmVlbFh1MW9i?=
 =?utf-8?B?eDByZzB2QW1qUlIyVUE0dTVzYnZJQ0l3cU45bEkwS2RhalF1R3FqVEtXMXV6?=
 =?utf-8?B?RjB2V0M4czBKRjVNaWVRUDRUNzQ4RllFOU1ndU0xSVczV0RkTHY2YWwvcjYx?=
 =?utf-8?B?SjVxN3IwZG4raGlkMWorOFQ4NmY2MkJxTmhhS3lpVUFlK0EwSXRPVWRISDlv?=
 =?utf-8?B?SHgva2hCOXNkNUxFRy85eWcwYTJVdVI5MW5meHZmQi9aY0hQRFBjZjdGWGZa?=
 =?utf-8?B?aEVCa055aHZHQ0JZTE1tcHdYb1E3YlYzVmxzMmxCd2t2VlZjRnFOaXc3d2Mz?=
 =?utf-8?B?WWZuM043RWo4MGFBL0E3TFBud2JGSXZGYW81T1EwZnFTTFhFanN4dnpsK0Ft?=
 =?utf-8?B?VWk1enRzem5VOXJmTStML0Y4YkJrQUt2WisxT09VUmZqMklIWmVTbGl3Wmh2?=
 =?utf-8?B?Ym45NHlmbUJYYUZtaU1WWlBtckwzbDFCMklqMktOTjZIZ05OKzlaa2RvOTky?=
 =?utf-8?B?MVBCMGowZVc4Y1dwSUNYVTN5MHlDdzE3T2ZQZlFmMU9PdTF1U3AwTGl0bE1S?=
 =?utf-8?B?VXlzMDdmdnJienkwSzVoL04zTGtLM3p4bTd3WEQrMkFyN1YxTGlTd3FVUi9N?=
 =?utf-8?B?ZDBTRlJxMVp6N0Z3NHpDWGZmT3hPRlZWT0EvcDJla3N2TllRWlMvVTRFOVhZ?=
 =?utf-8?B?Tm8xU2dxVCt6NzJoS214akFJM3k3NmozbmRLNnFkbE53VVpIR0pUYkwvVFdL?=
 =?utf-8?B?K2d4bWxTWlkra2VqVVhaNDdEM3hLcHp6OUZnMlQ0LytLZDl0R1Z5MGFxZWJt?=
 =?utf-8?B?dTBoUElUbHNnOVpNWE5BOFIxamhyUGg4QmJ5YWpDTW5kOEJQaXBRVDBSOEQ0?=
 =?utf-8?B?MTBzQU00M3MxSGhrZTk5R3RyMVRsYzR5bVFKNlRLRnNzcWZpbk1nSzB3M2Y2?=
 =?utf-8?B?d1J4c1dKc2VLdEJha2ppdHJka3AwcGYzQ3BvVVBoWnYrbHdTYVgwMlp0Ykl4?=
 =?utf-8?B?MUhGc0Uzd2RweERCbGZ6QWRiVUdOR3lKUXhuRnBlRU5sRm9DNjhHSmhpbVlJ?=
 =?utf-8?B?NlEvVE5NR3o1TUMyeXpqc0lBZzlrVVI5MzhlTnhBVDZVbTJLS09kUXN2SzNl?=
 =?utf-8?Q?D6Elf9tzMfbzv4s0NFqglhSfZ19c9tEMsaYFxHt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bc43ca-db78-4483-175d-08ddc29c7465
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 06:05:38.4338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9319

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.17

for you to fetch changes up to a3ec6cda33ea16e3b7cfee80a6278085948cb793:

   riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device (2025-07-14 
08:44:04 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.17

Sophgo:

For CV18xx serials:
- Add rtcsys device node.
- Add reset device node.
- Add ethernet device node.
- Add support for Duo Module 01 Evaluation Board.
   This board uses SG2000(old codename CV181xH),
   which is dual-arch, RISC-V and ARM64. This
   patch add the support for ARM64.
- Enable ethernet device for Huashan Pi.

For SG2042:
- Add ISA extensions such as xtheadvector/ziccrse/zfh.
- Add ethernet device node.
- Add Sophgo SG2042_EVB_V1 & SG2042_EVB_V2 boards.

For SG2044:
- Add pmu configuration
- Add ziccrse extension
- Add missing riscv,cbop-block-size property
- Add MSI/PCIe device node
- Add pwm device node
- Add SPI-NOR device node
- Add pinctrl device node
- Add ethernet device node
- Add MMC device node
- add DMA device node
- Add I2C device node
- Add GPIO device node
- Add clock device node
- Add system controller device node
- Add HWMON MCU device for sophgo-srd3-10 board.
- Reserve uart0 device node for sophgo-srd3-10 board.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Alexander Sverdlin (7):
       riscv: dts: sophgo: cv18xx: Add RTCSYS device node
       dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, 
add SG2000
       arm64: dts: sophgo: Add initial SG2000 SoC device tree
       arm64: dts: sophgo: Add Duo Module 01
       arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
       arm64: Add SOPHGO SOC family Kconfig support
       arm64: defconfig: Enable rudimentary Sophgo SG2000 support

Han Gao (7):
       riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
       riscv: dts: sophgo: add ziccrse for sg2042
       riscv: dts: sophgo: add zfh for sg2042
       riscv: dts: sophgo: sg2044: add ziccrse extension
       dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
       riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
       riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

Inochi Amaoto (20):
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

Longbin Li (2):
       riscv: dts: sophgo: add SG2044 SPI NOR controller driver
       riscv: dts: sophgo: add pwm controller for SG2044

  .../bindings/{riscv => soc/sophgo}/sophgo.yaml     |   9 +-
  arch/arm64/Kconfig.platforms                       |   6 +
  arch/arm64/boot/dts/Makefile                       |   1 +
  arch/arm64/boot/dts/sophgo/Makefile                |   2 +
  .../dts/sophgo/sg2000-milkv-duo-module-01-evb.dts  |  76 ++++
  .../dts/sophgo/sg2000-milkv-duo-module-01.dtsi     |  40 ++
  arch/arm64/boot/dts/sophgo/sg2000.dtsi             |  86 ++++
  arch/arm64/configs/defconfig                       |   4 +
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
  19 files changed, 2041 insertions(+), 193 deletions(-)
  rename Documentation/devicetree/bindings/{riscv => 
soc/sophgo}/sophgo.yaml (76%)
  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
  create mode 100644 
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
  create mode 100644 
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

