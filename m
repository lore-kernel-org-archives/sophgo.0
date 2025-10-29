Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010013.outbound.protection.outlook.com [52.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BA21FF26
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761707254; cv=fail; b=auHd5i10/w1ccRunfRdCN5o6NGM0j4FZCMr9v9MKBpOc8HiNIdyeiO8jpbGvQ65ItL7XfSzTVJi5Pb4RV2B7hA1SuC4b2Et+iT4im+gGa4HX5mS/vnqYyV8dR3T0rhiolkw+t62m22UR5SD4aq31QvTO+yqrKFVGKFOPgm+raEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761707254; c=relaxed/simple;
	bh=23yvGcJ6QeTBFcrQheR0b5DjGm2wMimztPVgCrN43k8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=tmcVJzzkiUcv0G5P1brDbyiOf8CxCNMxRiVOr+wxTO9/wkBBImstROdukxb372TbRjDpI/ZO6ktHpRbwKxCSYAtL0TPbVbXkvemlWI1gPbjpscQfR5RGDTyPwp7vn4tFq8JnFXI2koCAUi6rLmnB9rfQaM0vQzVzRKB2kP5pRhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VWsKbNu9; arc=fail smtp.client-ip=52.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VWsKbNu9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0BOiy6clG3j2GQM/dW75kaRejKgqL6F8T4WpsZmZRrvmZLhnoe1nh85RC3nW1fJ9LnP2hSok9izCMzAJtikdqf9Hh5pWrdffW4hMU5n4xD+qqtXltH5Vtk1mTiy1MbYA57/ydnEMjEQgcGKo1+K1vcNxdrQ7bfvEVNE/D1K3SU6h7s2lguP//fgt3lS22Z1RGuu7h6r11FEpwF5CUzeStYNb19I7HexrIPQV4Lr3+Z1cm0SJZYrivGiWOAGYtYo+aQOF7UJ7VNUiUGHeUBYWw9S6p/4hh+kLC3cAa78PAgrDfiumONBQVTdQmnnkDTKAkaC1Z2Nsum0ENvIdr6ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23yvGcJ6QeTBFcrQheR0b5DjGm2wMimztPVgCrN43k8=;
 b=MNMc6LPh9XBJKgSclA7yxo43cvVOl9UA//tAUkLWH8bR5yjtGsbF5D/pgKrPaGzbjkoCjnsYknXjWyK/3BEROcN+h8MzTQLRk+0xzWtsYeyWii1JZMeg5ZEnzhtMisJyw7ybxxz7gUzK1Q9lDPQEMFfPYIBkxwkWJxrmLdhqXas9z3Ou+Aq3Ql4EK6/ZtGvT6slV2VRDACU+586eMvHUFRsk2uGMnbv71ghvl30+Ni4+QAh9AP70iUACyfoUS4AEUST8CKr/Ob7jEyxJVt7QwZ2uNAQhwC4ELNky2TfDIOgjda5Ej5XcMwJjWMmQBmc46f5a5RVE2GEPtXHohNjwpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23yvGcJ6QeTBFcrQheR0b5DjGm2wMimztPVgCrN43k8=;
 b=VWsKbNu9xakxFZ17aCEYXShEe/sMoLllzzA5/UJo+eF8n8GV25KRoMJaUpNS9sIuiaOhQPP9enbXnct5DrWBm7YWcBRtOZPueXNBDF1iC66ycNq+0zOCCaAQjGyUFqy+extEF94ZtPemu3upu5CgXmHGkkA0Yc5VZ59x2OGXUdNbCzZE7AycA5ykvPE2KASxI2yDwC2zG3BwixNtmsCU99omwDZ3+MiSuuLVp1Y5oQIsmPZf2pWnoLtSoq+JE7f6AfYOzqkSBRLMPDyD0uP+pKrEAkZCAUcdrNVQ9KsTn4Jm0PrF9/ga5Grs4X2hY2YhYU1vzdAKOklLclev45jksQ==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 29 Oct
 2025 03:07:28 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f%6]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 03:07:28 +0000
Message-ID:
 <PN6PR01MB1171755C03F7973A28623683AFEFAA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 29 Oct 2025 11:07:16 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Oct/29/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::8) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <3f858309-a670-4118-82a2-ce3bfe3ff8b7@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|PN0PR01MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbaa540-01e9-4cbd-939b-08de169848c4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|8060799015|22402599018|15080799012|23021999003|461199028|19110799012|5072599009|6090799003|1602099012|10035399007|13041999003|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVBJbzkxQlZWWmZWQkRBcDhxSjYvNEJsOGowbzhXLzlkWWJQM0dhZmF3V215?=
 =?utf-8?B?SVRQZ05tVGxyTU1qb251QlVZckNGamFNWGYvdVVQbXFaQllBUnJRZkptdWlH?=
 =?utf-8?B?YWFia0FtbWwrc0psSW5Ed3dUZVlXb1F1dkxzYVN6VHVXWFYzOS9EVWFEbytM?=
 =?utf-8?B?U09icmYwMUl4dHZ0RVF0cnRzMmZDYUhjbUtndytNZE1PejFNUkEyMmQvTkdL?=
 =?utf-8?B?dnNxSDVrR1YwbHFRR0JHOEN5ZVJ0Mk0xTFJ5OU9RekRjcmZKUVRDMDNPMGp0?=
 =?utf-8?B?aTcwd2MxSFRwaGR6SitsS3g4UHNEdlFaV2x5M0JDUVpqdjNteWwzQzlKTVBO?=
 =?utf-8?B?azdoek1xdm5PTEQxbnNXVnhPQVlMSXVYaVhQdUlBSk9LSC92c2hqbzV0UUdo?=
 =?utf-8?B?eFU1YlhtV1JLcnRqTHM4RXM0MmRVcFJUemlBZUlEQXZTYUlyVkl2VVRHMVRB?=
 =?utf-8?B?TXRGVkQzcmIvLzBSL3JoV3UwRC90N2xBYjY3VEtLaEMxRTRkTlY2aFpYdjBC?=
 =?utf-8?B?YmR1TURQMmFNS3dvZzVRQjhkbW1HK1J5NkxmSmY5Vk9xT2RVdGpMMlA4MUlI?=
 =?utf-8?B?b29ENzNEWS84Zm5OTmNMVHRETFhYeExMUncvUndBZTNyaUZRcVlyVzc3SlFW?=
 =?utf-8?B?VktpTUJSempzaXQ5VHJiR0sraGtWb2N5VTM1aGJSakIyYTByaHJHRGRoQzhx?=
 =?utf-8?B?ZEgwME5xdzlFUzB4Z2ttbDVZYkZyTzNCK3BPODlkYVRHS2xsbE5NUWpsanpG?=
 =?utf-8?B?Y3NzRXVkTVlXdVJMcjFMWUJFaWZVOGJPN2ZtRGhQM0ZNKzNlcVNUVkxBSGtK?=
 =?utf-8?B?QmpiUEUxNi9BUzRKK3A2VEJlRVNUTEMxOHNvcUk4WGZMQndMMkRHRnNGMjdS?=
 =?utf-8?B?cXZwdG5qNnF3NDVGbVJzdDBxV0hNQTFTU2xQTXBMTGc5Sy9QT3RDZ2NVRXk4?=
 =?utf-8?B?aXp5bFIzSFdYRkQrQnhSNkRoMGQySXBsZ2pwT2RvMzkzSGdKLzdVOVlKZ2t5?=
 =?utf-8?B?OGhmWkdlekk3OURSWW4yU3k3R0tKajFSSmJUemJCWXpVUldZV2FqbWI3TVNX?=
 =?utf-8?B?YlVYdG5aZTJLNFFSaTZlbCtxbmswUWpqWGZvelhZOTc5V1NyVWU5ZDZrcml1?=
 =?utf-8?B?NTVGRURPSGtkZ3VJcldPM3RQcWQwaHpXMmI4WFRvTFdHa3VGT2ZrZ09zZndW?=
 =?utf-8?B?UjB3eDhwKzJiM0ZWcUFWM2UvRWNQSkxzQ08wbm5ZV2p4Yis0bU9FWTVjaVR4?=
 =?utf-8?B?cmhDUnN0ZzFQRCtiN3JhZW1GS1d3OTd2dXRzK0VHVTJQMFFaWitIUkJnUTNQ?=
 =?utf-8?B?Z0IzMzN6SWpFNWN4SmNURVBaMk8vMGtiaHpVczFtZDVNOVBMMXdhSXBlVWdD?=
 =?utf-8?B?TE9XaktPMnBKeEFocUJveEplSDNvVFpyTUxEemRCY2QvZGpVM2lJVWhBUElD?=
 =?utf-8?B?L1BlYWpEUlArd2E5ZUJVSTI5eXJpQ3k0cUtOaTVGd084L1pHT2dxeWFsRHd6?=
 =?utf-8?B?QnVHMVozQUdzb295SktRT1NZNlJoQWIzVkZ4VzlOR3BSVjI5TmE3WlhTaXNH?=
 =?utf-8?B?MnowUFJqRmJOWS9jVDU3NmtyeHpHZEROekcxajUrMGdscXRqTkh1M2RGRGlT?=
 =?utf-8?B?Y3ZudEhOeE84UzV5dWd4WUNyK3JSSXYxOWN1SWdHK1RuQVoyRDRrNVJqZVoy?=
 =?utf-8?B?eTJCQVhZL2grOUYvYVkxZFgzOUlmT29IY1gyOXk1OENQODhxQkxzeU96K1JL?=
 =?utf-8?B?ejBzYVRiSU85bnFjUmhKYWpSTjBQYjNMUkNjNS9xR20vcVVaRTFqRFpYeWdP?=
 =?utf-8?B?UUhxdFYrTGFUMFI0UFptUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXZwKzhyTGlvTmZjaWViUWxMZGNHZVhiMGY3K3dyRVVURDhhRktRL1FtVElD?=
 =?utf-8?B?ZytLVnAxZWhWSDUvd1Iva1B3ZWNzUHh4OWhEWmErOUNsLytXcERNQTE2eTYw?=
 =?utf-8?B?VVRjNkh4N3NVQzR0aWlnYXlwbFVJemlOUTJCYi9IYmxaSHpTc01DWWJudi8w?=
 =?utf-8?B?RnlEMTQzVUZQeXNZYmk5SlUzaDhDUE9heTgreWJyLzNTMXgveVN1Vk9kNjdN?=
 =?utf-8?B?UTBCUVhxOFV2WW0xdmp5K0hCOU9IYk5NdFN2L29EZkZxM1AxNkFMQ3FMLzJk?=
 =?utf-8?B?SjdtZ2VTWlVSKy9QQVcrYXgwM00ya2tWZ0VoTmxXTHlwL21MNWp3ZzV2WGY5?=
 =?utf-8?B?eEdQNFNEWUgxYWpqaVU4bzh1MmxWR1NYdFNLczczclQ3dnZBNFhLVWNOWExP?=
 =?utf-8?B?cnViaVNqTnBMbU9KQUdPY0RjOE94T2l3cWZQNEw5am1wazBGbnpJWDJJQ2JJ?=
 =?utf-8?B?cGZhOTluTXZzbklSRmZMNld3SGxGN2QxUHltWXJVSEpnWEpjdkR1R3ZQMkRo?=
 =?utf-8?B?N0FJN2xTZ2pLVDE4NHE5cFlldWJVdmxJNG9kS2w4U3p1eUxRZmtnd3h4djcx?=
 =?utf-8?B?K3RVd2J0d2c3VzgzaUY2QU93ZHlTdE82SUhtUkZsdlpkUUlnRlZLazRnejN5?=
 =?utf-8?B?QUp1UCt0c3NjQzlTVnVURFh0TkRVaU9sY0xUa05UMUZvcDdCK3E4UkN5WkVK?=
 =?utf-8?B?V1cxM3o1WWY4M3E3c2hYenJUa0ovNkI0RTU4SDB0UXJ3ZGRoMHZEVFhXM3dw?=
 =?utf-8?B?TXNCU0VFQXJua1RHRzhHRUJOWEdPV3J6R1J2ckZ3b3VKcm5la05JRHpNY1Rk?=
 =?utf-8?B?TEFsU1ZFZ3RlTHhPZ2FGOWtiUjlFU211TFFrdXlyLzBrQVM4Y2JPbEVCU2ZK?=
 =?utf-8?B?US9PWXdha1ZPSUlLT1lnQUx4Zlp3UHdmZlZ5cENXRytCcGVtaGJ3QUVpTUZU?=
 =?utf-8?B?eE1weHJBdllwendZbS9IQWlJY3B6cHNnMjJmdUVWTmQ5WmpzUERtRG14aE1u?=
 =?utf-8?B?TmwyTjVXSmNjUTVLNWhGTElwTC9NaWFScHVoY2dGWVdiSlFPcExOZjZPM1R4?=
 =?utf-8?B?cTQ5bUMwYkVyVlhIeEVtK2Q4MlJsUm8rSWtCMHd3QVFtMkQvVHVtTDhBVE1j?=
 =?utf-8?B?M3ZrbWE2SVNBSXBEM3RZc0hQVjMyc2lwaWlzYnMyd21OemNCY3Zyb2JXbVlI?=
 =?utf-8?B?enJab3M4OHRRMFNjaEdPcVFhVStkUmxwUFFucHVsai9idDhjVEs1RWNySnNh?=
 =?utf-8?B?L0JDTkFrQUlYU1pXZllFQkJQQXh0bnM2dkt1dk02SzNCdzNXSWdoMEpTTnZN?=
 =?utf-8?B?U1RQYXYzY2FzZDlmTjY0WHBDV3FuYlNwWURZS3poTXVMQXFRZXlDS29TY2Iw?=
 =?utf-8?B?ZSt4dkJPWlVvUys4cUQxMStQZW10NmhLTDh4aDNaWXUxclVhRmg4OTRwMlBu?=
 =?utf-8?B?WVIwZVYrZTUwSVNwRjhNVDRlNWJYL1lLcDhFNkRicEJDY3ZXM2huODBZLzRr?=
 =?utf-8?B?V2M2S3R5cEZNWDREaE00ZHVhSFJXdWtnYld4Rnh6ZGF4aHduL0IxSWhNQkJx?=
 =?utf-8?B?cG5tM2VhMzFoVVFxU2l4Ymc0bVQxWERzVUF5ODdvL1B1K2lEY01Rb1h6UlJu?=
 =?utf-8?B?a0c5NFNsdVhKOStNZFhWTUhuZUx0dmsvQTY1cmpHczc0NVVQMTRJZWNYOWVM?=
 =?utf-8?B?N3pERGRIdm5JS3IxRkN1K3FJS04zeG9CUkNIOWUzTDNsWWRaemptY3RZMFg4?=
 =?utf-8?Q?24Who7Gs0uNO1F2EGhYwkQ9nNE6WKqcVPVxSw0o?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbaa540-01e9-4cbd-939b-08de169848c4
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:07:28.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8924

Last updated: Oct/29/2025 @https://github.com/sophgo/linux/wiki

CV18XX
- Top syscon: updated to v4
- Duo S: updated to v3

SG2042
- PCIe DTS: updated to v4
- Fix a reference count issue in sg2042_pcie_remove() and queued for 6.19
- net: stmmac: dwmac-sophgo: Add phy interface filter: updated to v4

SG2044
- N/A

Thanks,

Chen

