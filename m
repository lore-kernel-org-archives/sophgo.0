Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E277BAEC
	for <sophgo@lists.linux.dev>; Mon, 19 May 2025 00:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747616102; cv=fail; b=QFNU/z5kEzW4vW3EogKtCvxYMyMwA22CgBbAvCHO8dzJ4P9u8ESM+GUuVXtvt3xZ78k7aDs4IYpp/KQqchoG4kmRxjJI3uZQvNwduMLUEcLPzhIWnZEV6HZ+MpWyVhBb1NprSfIc+5Ktw9hv/OZdKGGAUPUTdU3SCLPLS9jIdKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747616102; c=relaxed/simple;
	bh=CbdysK1yiMvah7A23f1a7tMY/skOZEsFacN2ihaQA84=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=czyTZfVJYSyDi88ru6d2Bilj5Zgnn0TEP3GXewWsx1gpeFqdTbACnCyLX96Sx0mzEfBL4KxqZPj4OA1SJvFXspKO/E5A/PXmlsz9AkIZwxxOsSo+8R7lBszxzzumFwe+iEmoLDRznOsxc3qkAdOyl73ZqBAdusrz1oTmF8YtPDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=d4GcZeLR; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="d4GcZeLR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc54DV4kqO0dX0toeDKYtEikDcNd+/QByU/U9Wm+cld01RP88NCS9xor7CPvH6r+b/WmjSp5XfTdqllh6t6KGkTSnvmpufZghZYo8eDLPVhWRB9BvA/CEjjuLK5pNR6nixEvxQuXOm9sbhBQWG9jtSAQvbeGj89RVtClZKwI0OIJ78FXTxTgf5x3p2y+C+mdFM6JtJD+mCkSuKOPGYGIx4RbFC5HEdr0sDh2L2qEzBHsBGaMnOnQgbDRpafOqEaqzU4beXSCHSjsctJTnYL6k3eY6iwS4H3/LS4upzb5IV5dYW/Q3BhTMiHovFKkQ64EjKbaZaAZSCWptpx9XWxCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAV/zqeDPhxSCTmiYmc/DSEoVU5AfflZ3eVl1wSmBFs=;
 b=GRPzObxY9MNWEWqRr4kLwaIw0Hp2rFf2aFCgv3VaOKg39c7HTuVCe8DKyWWM4r6QHWqZ0Wxr89c90FwpkKMzsZ/YGG7TYgMHarYjddQNBRa+JjXLIfxiwCjm2nPriWlzIbwCN8IbLaaeabTWIOL2O5J36pDciYvXVfdc+cbK8gsfMDxpwssZV0aK0PMzlUUB8D/gpr3L1h7GObnwC9G4F0rKGiZmLKq6upSuqkwlSIJcPCs65a+8GbkHeKQfVYFGeLaeK3jPPCDdFShQA2S9tpI08WzlNhsh6LZN0BT7b4gA7kWLbdJ9Ywzyu90iVtRzagffQZgyw+KjOXhHZaTZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAV/zqeDPhxSCTmiYmc/DSEoVU5AfflZ3eVl1wSmBFs=;
 b=d4GcZeLRAhDv3fZYJyZCFKUAhtSgnvze7+wYpvSg7PY7Owp8fkSFXjDIXhcFFPHeWznLuUEA+HESNv5O6WZqEqtgOhCVOojMc/PaSEagnH2VnGV8FHLKYMQM0mDBEuRGYM9c0JLMOoyBX6JK1m7aIENOG8oNW3+D1+65xxRe1KvRe2WgoiTYderG42WE9bq4l4PpjETZ7L7K4U7pjGgneUX8ZZmSzzvrPUexnYNUG4sKdCbf42OKj1IFZjwxDO/3qyxeHHyxGZoRmReLPrvAt4/OwjP9pROT5NkIvr3czM5eT4cWVHBsNF6lvulxUhTQe3j2zYoaVGDRxZQUZ8JGXQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB1400.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 00:54:54 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 00:54:54 +0000
Message-ID:
 <MA0P287MB22622FA23ECF9B9216735FA0FE9CA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 19 May 2025 08:54:42 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 sophgo@lists.linux.dev, linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:404:28::13) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <eb8ac423-7314-4e30-9486-7b0870fe803d@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB1400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef9ccab-c55c-4f34-18bc-08dd966fc302
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|19110799006|8022599003|7092599006|8060799009|5062599005|5072599009|6090799003|461199028|440099028|4302099013|3412199025|34005399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm5PU21GUG5QdnlzUzF3eHhyektBSmMzU1drV1N0MVZPTCtGSDFhY2Y2Mkx4?=
 =?utf-8?B?SHdrbEdmaUtYT3V1NHpYazVESjYyQlhwY2lyc3dLd2RWTEdxMjdGa3dyN2FP?=
 =?utf-8?B?SHIrdzhEcDBOT3dEaldTSWxrSE5keFBUNmdDY0ZJL3R0NWh0aCs0b2FsdE1a?=
 =?utf-8?B?TUFGUXgrRmlza1RHQ1g1SW5mWFlHYWZRbzhEQ1lYYTFBQlpmQ3djU3F5MCtX?=
 =?utf-8?B?Rkt2aWt1dEVPdXFSN1FlWm5Hb1U4UVZpRkhPZUlDQytlbEdsODlqbEJsT0po?=
 =?utf-8?B?cGpZSVlVekhEQTEwYmdLUWx0QUVXRnpRbTFIOEtNNGxrV0hrYm9QODlrZWZn?=
 =?utf-8?B?TFc3TnpuOVlUT2dPZlRqQnRGZjFURXRMbUhidjVjbjc3ZXBLQUt0ZkRwMGlD?=
 =?utf-8?B?NGs4aHRjTjRLNnZEQ0U4Znk0dUg4WGJheGgxYm1vUUIrYmVFY0lJR1Bja3gy?=
 =?utf-8?B?TGFCeTk2RjlNTWlUaEJZZnlHUjUzc005WmpQM2dwZGJ5MmprMkdSUFRNMkJs?=
 =?utf-8?B?d1hxaVBVR3kwc05xOEY5RzIxVFZSYm1va3Fkbk0rZnliK1RTVEt6TkhyMlVG?=
 =?utf-8?B?UGx5YVJDUmJBbHBVbUtmc3Q1aTFhV05HUCsxUWt5SmcxSUZDa1BpbTlXSHMz?=
 =?utf-8?B?N3ZVZDRPNUtCK2dTakRidERGb1VQeDZnM3VJMUVBZmRqcTR6UFNDZXJEQlkv?=
 =?utf-8?B?R1B2bDR2cFFVWFgrZjM3VVNLREZzekEzOEg5TlZqN1ZFWEdRY01uWUJYRGhH?=
 =?utf-8?B?OUZEREo2bS9rVHNHQkN4elZSZmVDMUFOODhWaUFwOGZEWW9MNmJ4U3BzZTVa?=
 =?utf-8?B?eDQrVmF6UTk0WVlTZ3FIYTBmQUljcFJSQ1FXMmptbnh0d00xVXp1ZnRmZjNo?=
 =?utf-8?B?blp2V1NacVhGc2hENERMSnQxNTZ4b0ovT0lISjJhZmYxSzFQbUVoUXV1YzY5?=
 =?utf-8?B?aWcwclJqQzdiWkt3aWNmanRmcXA2dmhyM3BWdlFsMjlSRHA5b0FLSmM3N3hB?=
 =?utf-8?B?ZGRkZ3RhMEdGb3l5ZkpJd29WK2wveE5rTHhGNk83T2VKWEl5RzVuanlZeEY0?=
 =?utf-8?B?M0ZKYzY5Ny9ZM2lxZFByOU1hVUtNTnlVMmlROHBVaktGaEk1WkMrYjhGampE?=
 =?utf-8?B?Z3NrN0ZwRyt0d3VteHY2anBkbjlEcm1EYkRpWUxGTHd2MGdoaUUxY21jY05p?=
 =?utf-8?B?Q3dNVnVxY0tnWDZYR1lJSlpmVnVSMGErTmZnSWxBRWdkdXpJcmlqcDVLdTJm?=
 =?utf-8?B?Q2QydnNSMzdOakVWd0JOV2JmaVFlSVpmeVNpNklxRmNZR1JHWSs1S3JoK2My?=
 =?utf-8?B?VDZDMzBCUThuSFpRdis2RWZIbDVHNElSYVBRR3ZpRkRuRUdXMWk0WUgxN3lw?=
 =?utf-8?B?cEhpRWZRdDR6c09yUEl4T3l0NVpTNFFKcFZueWtleWUxZGNIdGVKRHN1WE9a?=
 =?utf-8?B?alNpRk0reEtKM3BBUWM2blZ6bFdhdnVmVkNYOXE4NnYzUUh2ZUpFWThudEV6?=
 =?utf-8?B?N2htbEVnMFRTaHRsbHZDSldYV0hpTEZkYU9vNUhOeUxldTJHNURjMnFOR2ND?=
 =?utf-8?B?RVhxWHdLczVlVXNPSFNQTEYwNG5obDBTSWhlemlvRkFVakc2RVFXd0ovWmZs?=
 =?utf-8?B?d1poc1NQS3VUaW95dWNDZjB5cnppTjFWS0dFTjRnQ252ZFVKcFRXc3VUeTh1?=
 =?utf-8?B?dVdBbXhhUGlUMGNVVCtOaEh0K2poTXJJbThLbUxGeG9YeExJZkZ3Q0svWU4w?=
 =?utf-8?B?VzZWcmlJWk5GWlVTT1MxVUZ1TjROSU1hZ25oRy80OWEzVXRaeE4xNmtSbTNo?=
 =?utf-8?Q?Gf17l9zxMxWmsFSsy/YRX2oTzoTOXoA+uxGKI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUt2YUJ0cXBONTJMb05wYk1VVW5SWlN3bjZTbm8zVlloQ09uVTBIeU9jZkp0?=
 =?utf-8?B?Nnlrd0ZBbkhwSi9DT0dxZ2FDTWxvakYzSjMxTTN5NGlLZTZINWpMRi9pNWR5?=
 =?utf-8?B?NEw3RW10bFFFOEp5ZlBKZUx6Sm0vZE5RU0FaNExxYVpGWHVJK2VDbTlBVmRz?=
 =?utf-8?B?cTI3WEJjRDRnMGEwVlpvcDZWYmtEcVdvYTRSaEpMSXlsYllKSGg0U2xvbTlH?=
 =?utf-8?B?SjFqNXhZcTJEWGFzOGNVdHI0K2lEOWIrRUpNNC9aYmZicm1vTHVZK1p0cVBG?=
 =?utf-8?B?dWZUQXR2L3NsRHQxUUpLaXhJcHlxMGx6L3RFQU53Rk1kY2pweFFrY1d1dktz?=
 =?utf-8?B?MCs2TWRKbHdRdmZ1UVp4dEQzVUhEaXdneENqcjhxaXN5RDJpNnVxbkpURHJ6?=
 =?utf-8?B?U0poQzVubWZ6dldOQUtRSzVlZVBmaUJZMnk1SG91c01IWHc3RU51d3ZRa0tF?=
 =?utf-8?B?amprZmpxK3dFeDJyK0dOanlRYkg4aHBYdmRIN3ErWkttMWZ3b2p3aDUwUGNE?=
 =?utf-8?B?V0hkQW1PUFpIMnhJTU5ITjVYRklId05FeHFReTRRVkc2d0QvckVGRzhEOUYw?=
 =?utf-8?B?SitTZzhBZVlMMXVWZy9rWCt2d1NQbHZseDUvb3hLN1ZVVXEwY0JyS3VDQ0tM?=
 =?utf-8?B?enpxZVhXcUtmMVh4dlpsTU1pdUR5MGVLRG5Wa1dzMkZYK0dYMFJORXR6bi8y?=
 =?utf-8?B?V0JrUSsvclFxZnkrUkpZQlZmR0NlMDVIVzJZMGYzRXlsVW1JT1R6emtRR0gz?=
 =?utf-8?B?empCYkwwV0c3V25Fcjl3U2VGaS9rRzZkOXM3Y3lPNjQrVDRiL3dZR3p0WHJ2?=
 =?utf-8?B?alAvMlFEUnh6VWpKZEpLYmNMV0pQN1o0QkpSQTh5NVlSZTBDOVFnQVNtaVYy?=
 =?utf-8?B?VlBVSzFBc2ZWUTdHcHA3azZUckNJVlhkQ3RMNlBKRWkxbld0TjJsMjUwRjVR?=
 =?utf-8?B?NkhqSGQzb3diZSthdGppY3R6Tkl2MTN5U0dPcldEemlheTFxbFFoZjJ0Mmh4?=
 =?utf-8?B?dm43OHdLVkYyTGNmQk1KMmY5NHBSV085NEE1OTZYN1NNVkoyQUdzcHJUZVpX?=
 =?utf-8?B?dHFDNnZKSDJkcGRPNEprUzhDOUJ1UTlLWHU4NXU1a2VvMHA3N0hWbXRuenRr?=
 =?utf-8?B?a05EK3BiWE5xUnRBcGVuMDNPejQ3Y2lxdHN2Z1lQZURQRjYxajFkbmVRNWJh?=
 =?utf-8?B?Z3N4NTRqdUhDNncxOGEvNDB4QTQ0ZUYzODNCWXZCdElVSFBRLzk0WVlLR1BY?=
 =?utf-8?B?d0RVM1hsRlNTZjZudWVvc2FHWEZrbXN5YjV5Qnl0QXBzUW1aYXdZODJkemJB?=
 =?utf-8?B?dEkreU9VUmJKWTcwcWtsaExsMExhYVdndkhRVFlTYlZ3TlQ0cjlDcS9TaFZw?=
 =?utf-8?B?WE1zY0pYR0twa0h5OEtYOFBjRFNRSWxmQzIwOTh2V0dwS1NXaVV4NGN3M0ls?=
 =?utf-8?B?eGNOK0RhOFNpSFdPTTNDd0IzWkNVUTNYTTdaZVM4NnZQMlYxMnVnQjNRMDNO?=
 =?utf-8?B?UWVkdW1kcSs4ZzhsenVXM29ReVg2ZE5pTENPRFh1eDhPZjVuNW5qSVRxdWdx?=
 =?utf-8?B?d1dRbHkwVGtUcjExdXBJZm9CbkY0cDREbUFzVUp4aUJJY1RNV1lYVHdVelNH?=
 =?utf-8?B?WC8xeEZxYUlqMEhkcm5QSURpamZpWm01TlFRRlBCd1Ayb1NqN01KUk02SGx5?=
 =?utf-8?B?QXlwZ0ZrT0JzZ3BOTzNrQ1dpRndBSTltMzRyZHBMZHJ5VkpOMmU1cHo4dVFk?=
 =?utf-8?Q?0ozU9mogKJbPfLEaVv0OwBCeUVgKyp49fn2lu2z?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef9ccab-c55c-4f34-18bc-08dd966fc302
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 00:54:53.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1400

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.  Hope this PR is not too late 
for you.

In addition, I also sent a PR for sophgo/soc last week, listed here for 
your quick reference:

https://lore.kernel.org/soc/MA0P287MB2262B041A26A0F5EAD1E296CFE91A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM/


Thanks,

Chen

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.16

for you to fetch changes up to 108a76779829a5e8001b1051080aaa93e7fc02ea:

   riscv: dts: sophgo: switch precise compatible for existed clock 
device for CV18XX (2025-05-19 06:23:26 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.16

Sophgo:
Add Pinctrl & SPI support for SG2042 SoC, and
refactor the dts of cv18xx to facilitate adding
support for arm core later (SG200X has two cores,
one is RISC-V and another is ARM64).
Also add initial support for Sophgo SG2044/SRD3-10.
SRD3-10 board bases on Sophgo SG2044 SoC and
initial support includes uart only. This part of
the changes involves some modifications to dts
and bindings.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Inochi Amaoto (10):
       riscv: dts: sophgo: sg2042: add pinctrl support
       riscv: dts: sophgo: Move all soc specific device into soc dtsi file
       riscv: dts: sophgo: Move riscv cpu definition to a separate file
       riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
       riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt 
number
       dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
       dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
       dt-bindings: riscv: sophgo: Add SG2044 compatible string
       riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
       riscv: dts: sophgo: switch precise compatible for existed clock 
device for CV18XX

Zixian Zeng (1):
       riscv: sophgo: dts: Add spi controller for SG2042

  .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
  .../thead,c900-aclint-mswi.yaml                    |    1 +
  .../devicetree/bindings/riscv/sophgo.yaml          |    4 +
  arch/riscv/boot/dts/sophgo/Makefile                |    1 +
  arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |   39 +-
  arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi        |   36 +
  .../boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi}   |   95 +-
  arch/riscv/boot/dts/sophgo/cv1812h.dtsi            |   39 +-
  arch/riscv/boot/dts/sophgo/cv181x.dtsi             |    2 +-
  arch/riscv/boot/dts/sophgo/sg2002.dtsi             |   39 +-
  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |   72 +
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             |   32 +
  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 3002 
++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2044-reset.h          |  128 +
  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |   32 +
  arch/riscv/boot/dts/sophgo/sg2044.dtsi             |   86 +
  16 files changed, 3502 insertions(+), 107 deletions(-)
  create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
  rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (75%)
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

