Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011027.outbound.protection.outlook.com [52.103.67.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E48C2101AE
	for <sophgo@lists.linux.dev>; Sat, 28 Feb 2026 02:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772244317; cv=fail; b=l3XrWbvYGcq2LxFNJvxh+RDnvZKbz1boyaIK6yCMEl+M18IS/8fWJ6R9Lbc+XWzNDxAKUrNJ0I+ACTEY1ylrZxl5sfXVPhDriLwmfs4TAyGQVNip5kqEVAvQuUIZM6F59quJx0wpkjQlDPV/CZaQmYe1X+Xra2Ac4Dbo1qLqMiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772244317; c=relaxed/simple;
	bh=s7qS0bovCvTEAxvFAZQwCpcoci6eObfuK3jlPhyM4no=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=Ih/+dEioNWK6yuWz1eqRtGh3IwXQ1IUnq+cHdnMS7ektivjBGCevRQBma2dG2oCRC8UU2ap2X033ZLYbNo7qdjjKC5HDeYN4T3YX3Z0G09hyx2+nE+mCGFNW0NatMQITH3uuJjJrItxZDUPMKeEKLnOWpuPUUeU5rRZ9kilQCHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=G5pi5TyG; arc=fail smtp.client-ip=52.103.67.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="G5pi5TyG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkdSC0Sq4HCITgkZWwqIJedHdDHRgo9KHBbZXA4uIRy7JliN0KzOePJo90FwwlxMZu/d60WkbisRllpEanmmI7A1IHKb/QFEuQzvPK63y3XWufc+OwFywHY2HKh6g4AqIvIPMgW6I5UWdXOs7KAeWK5eKZY5xPyZUnwkV8GrzfbmSEwvc/vQWrtuE7P+2D0Bn30GC+Gp3ntR5dboOeePZS967VNrlvR6BYvUjBrsPNqyVrw5DohUsZJcbjrHBkjRjCGGELjQ49QXOwfunjmKUxzEg0x3vARrSwfqV4WqlvdcL1SLQhwrGqVVkLKztJI96HvO1UZChy1/Ez1A0FQoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SHkzNKnFaXuR4m3yQAXn3PHWjBOit9tE6BpkvZXkig=;
 b=IJPMokztrb/49aVrZJXjpZXhHq1ySYBJHgJ5gOLYvyhS9SxnqVK8S/uVUGNevhYfTTmZ63PK6DuoXN9u9ge2W4zd7u+KJF85xODGvbczvFZ+k4JsZ+2dCBc0ntXPIqXU1pEt/DyRvGqwluvFgsWu64gDCMzTjlX3LO6+Yn4EyBU5fRRzh/0pm7yrVfISp6VHtqR+ZM4qY0Qtbj4mwrNCAy7uTLwAgpBQ8NYx5aL6eZ8oqRijdfzYxR0zi/fHiJIPdxPkgMne5Teh3DYbJs3I+IQgv1ntvkSdVEfhy/qYAsmtMS2ioznQy50TviU2OelIwuq3u8UNy8+8NG8FLxDTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SHkzNKnFaXuR4m3yQAXn3PHWjBOit9tE6BpkvZXkig=;
 b=G5pi5TyGy8K6BEXx8K/AE/KwA4JPZoepgJ2ODZXvxOJdVOl6jMcju8ksZiajH2AmaCD5PJL6uXkBZgMFiSjxVfTV348rZe2fsY5vbokund/fLIEraHXq8t87ffJ+O//K7Cn7Ax8+j/0BzwxcpRqr4wJQ2hol38tR8wxzxFkm/fBIhN7VT62Uw3oCDrC3N3myQCDDtzjXt2JZWNzMqyyqsZ2GsC1WXYtlIF/M802oB1P2zOdcq5KZJuG4/Obcl5AXDhHf07mQqsteTLVinjIJYg8LJpUxrP4qmphl0pWdJs4DZweqA68PyR6WiSZwAI0+baSHJUAPOkocu81M+yfFTA==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PNXPR01MB6801.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 02:05:11 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 02:05:11 +0000
Message-ID:
 <MA5PR01MB1250086167334F709F2303068FE70A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 28 Feb 2026 10:05:08 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Feb/28/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <37764988-64d2-4632-9e72-0ed29d5f53b5@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PNXPR01MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e280ac3-ccab-4580-c3ca-08de766dcc8e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5072599009|6090799003|8022599003|461199028|8060799015|19110799012|22402599018|23021999003|10035399007|440099028|3412199025|4302099013|13041999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?andmVGVjR1N1cGp6ekt1VUpneTFlVzZxVEdpWFd2dlo3L0s2M05GZTlSbzlE?=
 =?utf-8?B?a3hRRkYxck5UYjQ0YlJkY3BvZEhpcVhHWGhxSHFqcHBrQ0JsdmRKcG1jOGMw?=
 =?utf-8?B?bk5WK3g3SnFMU3haQ2J2VUVkS2lkY1pXdnk0YndPT25NV0ZBd3NCSnNGL05O?=
 =?utf-8?B?NzRHRmFydXRlRHVOWjYxaHg3QXpnalJqMTNOeStxajBiVTBBVlFOSzVkZ3M0?=
 =?utf-8?B?VURvQUdXTTB3VEl3cE54ZkR2WXViNGE4WG1tK2k0N0RqK0FKYzRjV3ZRejVm?=
 =?utf-8?B?K0dManBVVWNFTHhXeFYrUWt1VjdtZ3NlQmVQWCtxS1RpNFd0RjkycE9SdGJ6?=
 =?utf-8?B?aFlwai9ZSmhnVU0zNnpySm0vRnBoUjgxWmpET3hIZ1JVT3kvNzFKQlJpYnZN?=
 =?utf-8?B?YUpEZnQwdU1sV3pINFA5eTF0R3JZenV6dUt5RDc5MnljSlF0dUxCMUdWZ1ds?=
 =?utf-8?B?aGFYaVlOaUlQU3ZmUmFycDcyK0pLdXNQenlseEhVbGhMTHdzLzIrNVFMQmhO?=
 =?utf-8?B?OTJCWkM3WnJaS0VMcUhnMEU5UEg2V2xMWDg3YzRMdTBBM2NISmdocHFpa0ty?=
 =?utf-8?B?TU1jd2lEN09idkQzT3pFMHZGZU56NTBzY1JEQXIxeFBlOThHa1ZwQjB2d0Z5?=
 =?utf-8?B?NTVXbTI5WnlUMitGRGpHZ0ZKYlphMUJnV1lLY2E4VzRkM1ZMdFQ4dVpWSFJB?=
 =?utf-8?B?bkpLY1daVm1yWHZ3SG9DRXhSOGdST21rZTJ0TnBZaHVHVXJWV0tYUnozZUdv?=
 =?utf-8?B?QzVIcUJVbDZSQXI1T2NBdStZNEdFRE4yV2djdmJ6OVMvMTZVbUR3cnlLdzFk?=
 =?utf-8?B?akNISTRkZUttUzFLLzhQZU50emZMVjV4WUdwOFhWZElPS1c2Z0lqbEhZU1Z0?=
 =?utf-8?B?dW5GYlh0Vi9ySXQ4YzIrZk5hTzc1Q2dUZ0RvQllqeW5RSzdhYkttRjBkSEJj?=
 =?utf-8?B?L0QyUTNoVUlydWhDUEh1YmIzT29ndEpSaGpCQVlndHVSMHRBbDJaWE1xa0tz?=
 =?utf-8?B?VDJHL1NvdGcrV2JSdEdZTzBMYzk2UW4vUUxMcmU4VmVselN1NnlSdi8xdVdu?=
 =?utf-8?B?MlBPdzF1UGwwR3FSZk9DUjVZVmMyNkxLOEpGclZQNjJkQmQ5N3FyeUtvb0sz?=
 =?utf-8?B?Yk80ZXdOTk1IT1NZQlVRdDlNczlDYWsvSUxPNFJKbW96M3NaRDV4Z2g0ZzVi?=
 =?utf-8?B?SkxObzQreVV5OEd6ZTVlTVNyUjRaclU5eDVWSkdYRFQ0UWEweUJybWtkQyta?=
 =?utf-8?B?WDQwT0FtRk5JdktkZjM0U2RVd2RLSDF5bnB1VXR3TFNlL0JPbVlCTklOcFhi?=
 =?utf-8?Q?tYkI6sdAm+Lkww99E3kuTGM7nHS/0guB8R?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlU5c0R1ci94enhEbFZDRnh6cG9WSUtDWFZEYWJVbDJmSVRmOERreUZKRGoy?=
 =?utf-8?B?VDFiT2pSRkxUVXNXMlhBVWNFc2tuWUlZTzBkbTU5OUxtYks4SXFyK0J5cEVi?=
 =?utf-8?B?UXJ4RFpQekM4T2Y1WkYvL1lGVVZsN0c1SEpPam9nbVJEYTk3cVBCa0NNSUhk?=
 =?utf-8?B?ZUpLWjlveTNrQy9hVCtvZG1wdW4rRCtmOFV2NTZ2TXQ4MHJ4QnA5UlRQeVI2?=
 =?utf-8?B?d3UzY29wVlRqdGYwWUVHT3JPdkc3Zjloc1hjcG1pZDVMbGUzTXdER0kxVE4y?=
 =?utf-8?B?a0doc2tuVnRoY0pkd2NjelVadVpGdUp2ZXZ6L1dveXhVMnBBWE9sb1FURUJL?=
 =?utf-8?B?c1drQ1pLY1Q2NWJNRWNNYXphc0QvMit1d2dvbUF1STk2OHFkNDdmb0FDUktK?=
 =?utf-8?B?azRzdDFBem5yNHpSS1FCQlhIUHlzbC8xc1ZyVWZsaExRYWpzYTZxMTRkYjFw?=
 =?utf-8?B?Q3VEdnVUWEZ4SEgyWFBFVEN1QjZXU2t5anV0NnkxL2RLYll1ZGliZEtQWUVo?=
 =?utf-8?B?M1N0VmtSbGd6WXZDMytzMVZYa2pVQTB1c2dsaGxtN2FvQUVmQXd2bk50MkJ0?=
 =?utf-8?B?WjVsU0ZjUE56djlpV0lOZHMzL1hjZUIxMDZiaWxJNGFPMHBlQmQ2UWszQjYy?=
 =?utf-8?B?VURRWGM1Y1hRV1Fnbkd4K05WZ2l0Nk96ejUyWi9oRXNMOS81QUVnd3JaY3h0?=
 =?utf-8?B?Yjc0YnkxdjhlL25zelYwZW5BRXhGSEJqNit6MGZpNUVuMDZ5c0t1REpZcGdS?=
 =?utf-8?B?c1JyUU1INWY1YXh5cmZEYi81Y0R2WW1FcXRrZ2VxN0w4dmFLanpWZTUwcXRv?=
 =?utf-8?B?dFRuRmYvc04xR1dFV245OHVwYjROSWdZcVQxM3ZGanMveTIyVzFGeHNBWTVo?=
 =?utf-8?B?SXpYUDFpWEp3UStrSHp6VmhIQURKREQrbUVQdGF3TGlEb2RpSXNDUllZa0dG?=
 =?utf-8?B?QUJTd21mc3hzcFV5Zy9JVXdVUVdiWnR6TTJwRS9vZWx4OXFmRXU4ZGV1K1hu?=
 =?utf-8?B?QnZmZUNwZTlPYnIwb1V0N25JYjFTWHBuWlpUZTBJSzU1dWtqL1h4UTE0OTFO?=
 =?utf-8?B?cGFiNHkyUmJCWFZNa0tTWThuVk42TDBYL3N1TE9XeFBUSHI2NWUzT1dqaVhm?=
 =?utf-8?B?SEZUanRqQ2xWTklsaG9wQUFnM0RTYjkvZHNYODZzUE9SclJ0b0xpR29NRkpY?=
 =?utf-8?B?NzF1UTByd3YzTFBEODJSclNEM2pWeWNiNllEZHV4SE45cUhVVkJQQU56K2Rm?=
 =?utf-8?B?eVg2UEMza1Rwc2dwQmo1THdZbWdKc1EzSU5JK3dHSjY0MXYzanczcXZuWFUz?=
 =?utf-8?B?UzZIVTU3SmNFSGExNEh3VFZHMlBVSlBOSng4T1pndFVyZ2lsUmxCSlhxUlBj?=
 =?utf-8?B?dFIzcHdKcHFuTGlROXIyMFdEcmF1TlJINnBHTHVzcW9Hcmw3Rm1QQW9scExD?=
 =?utf-8?B?aU00TEMzZVlMT3ZHU2VRVEE5L1BuUFYzSHdQcEs1cTlJREkrUEdIZXpUcld1?=
 =?utf-8?B?WnNSNVh4c1I0M210Zk53YkpQRWoydTJ0Z2wxeU1hYWJnWnpJV0F2azVFN3lK?=
 =?utf-8?B?VEdBRXdUQmNxelhTakJIYWZYbFZpZXY0dWo4YnlZZUFWMlplR0hzQjQ0UnJp?=
 =?utf-8?B?U3N6NnA4dlBDNHRHVkFQN1pLREM3R2l6eWs2UU1QNkhpVXFxd1VQa05xM2JQ?=
 =?utf-8?B?TGdOOEhzQVNHMmcvTjkxZEZKNlEzdzJPckYzbUdmMkxVRHBScVhrZEZuc1RU?=
 =?utf-8?B?aUdIUmFlWUlhSGt1M3pxWm82QTJaa09zbEZHZEFpKzVGS0VDVFRCUTgxRk1t?=
 =?utf-8?B?cnNZTktZNjZ2c2l0RTI3czZHdkV2Q3I4bUd4SWlyczVRNHNOajcxY2xDOVB5?=
 =?utf-8?B?eGRKd2djaFdHU2ZrMDE2Rkx4S0RZWjd4ZGVFOUsreVJlc0VTcVJHeEZwQlJK?=
 =?utf-8?Q?eJHsEW46ISxKpbE6tXvP7RYJzWZe5Igq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e280ac3-ccab-4580-c3ca-08de766dcc8e
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:05:11.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB6801

Linux Upstream Status updated: Feb/28/2026 
@https://github.com/sophgo/linux/wiki

CV18XX
- riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes: picked by 7.0 
which is just released.
- I2S/Audio: drivers part [1/6]~[5/6] are applied on sound/for-next, dts 
part still need some improvement.
- Allow DMA multiplexer set channel number for DMA controller: updated 
to v4 and applied for next, expected to be picked by 7.1.

SG2042
- RTC support is picked by 7.0 which is just released.
- riscv: dts: Move plic/clint into sg2042-cpu and sort peripherals by 
addresses are picked by 7.0 which is just released.
- PCI/sg2042: Avoid L0s and L1 on Sophgo 2042 PCIe Root Ports: Yao Zi 
took this work from Inochi and submitted v2. Thank you Yao.

SG2044
- PCI/sophgo: Avoid L0s and L1 on Sophgo 2044 PCIe Root Ports: picked by 
7.0 which is just released.
- Add "b" ISA extension: Applied on sophgo/dt/riscv: picked by 7.0 which 
is just released.


Thanks,

Chen

