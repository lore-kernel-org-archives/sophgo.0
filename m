Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010015.outbound.protection.outlook.com [52.103.68.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0121F4613
	for <sophgo@lists.linux.dev>; Tue, 23 Dec 2025 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495848; cv=fail; b=LVlmuhnuzA8Puxz6itVs6WBS01w5vuRUPzgkocgocierwKgCHemqlfFFa0J5XesZl3G3ytnJyV0g7f48COtsmYsj/ognlIY+YBzdUqBjDJjfpQlVLW5xBUQn64+OlDqn6IOgAK716aZT+lse56KabCCw8oNoGDpBFS0FvMr+dA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495848; c=relaxed/simple;
	bh=3crU9mxP4tdyy/m9Dm0WSrXbkykX0qLR6OqdmCQJHjE=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=PPtkZuJK+crbKEHx0seQRFzB0LUwL01POCPlvV1CsYhXkDCdw68XTpUVmAxXUHW9azeefNWDY8X3AhMVIl9+PS0o9VQ+4t+5SI18BDLdXE7jaJQdI83j13rmfx7v+SgMKEVqtqcKbr8do0iRnAgCulV8QwlxJvAELNd/MI1J/3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NYJ04Zb8; arc=fail smtp.client-ip=52.103.68.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NYJ04Zb8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFBPXNhFLTksM/Ttklkhn1p1DKChTtJJXsnLSpxEC7TXC3Ttuwek06Uks0j9isaIzHjU8d/yMiU5A0h3cXkQAdMNhUySrIgXuS2M+9urk0NC7qIyqaBxN2+r2FVrs+I0jq+rLRLjKuysnpzJFMV6MEw5ManZNlNljK+j6GB+QG6yb8zu6rjt3RgaW4hf425JATT3hrwF4qW7VJHNvkUpNxm0a5VjRooqXuvM4QAQzi2xx5+FQ5bciB+y4eJWx6NeXH1Yur+2qW0T22OjePCAhaR4EyqEwOfSYDLl92cXXFkUdxgrUIv7rj0QLbo+oxqVfFIEl7iWDxBcLuQBpuF/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Kg+S4rLqRqalO4hO2+bboZQGlK6olfI7f7RIm23cw4=;
 b=BTe2X64jx0tO4MSME06bB7Uak7lM+0RA8QI5re8egXVcQd5dXJUZcQQGBVmlx1VxZ9hoFXsKkeTcOPqGfPBPC9cpPaenakrvlRurCSC1yL0wE1lAe3ll5AZgHC0Uz7Tdd4b3hdJRMXtBnOLrRzZUv75Hi5FshapWeH5lVSNL/1GfBH5oRwu1k/kRd9XF1IXohEYsVjY1C26JVX+f02nVD/lV7BO5gteMJarHirPbamZm3S5GbEVTzRij8aqN6uRtOTG/MmXDPDG3VWwwbZsX09EClDwEb83IPapWAcUcN1fJuuvn5GdVo3nF8efkut21DjbevDOBANzsNx25W+5Cyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Kg+S4rLqRqalO4hO2+bboZQGlK6olfI7f7RIm23cw4=;
 b=NYJ04Zb8h2RtXjtKsr74lTqaWGG/78AOCqEc0FG/Hp9lacEM55zWk8PlksDAYdf4GVxceBUuoxKlTH4a1PMuc6VRAeEZ+XLr15nDAX1TTE9bqTUIpxR26H2RDaVBOQsN/ykCdHMMnmcUeJYgbGOjw+WL+bSRJRGsFLiTwusiRiHNEvPM13z14agfXT7kkwhCKr+rJUlCt+S5CObfd2zwKCTpLSw3JyIVnQGGRuafw6/21OzzEetMttII+YUEWKOYZczKW+pPlXxfxRRymkhkD9UYzuFz+fTl96ndqJMRVYZCQsviSLa6EU+YGhlq9Rt1jP9yeDB3w3l1HHPV2BJ2og==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA0PR01MB6360.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:74::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 13:17:21 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 13:17:21 +0000
Message-ID:
 <MA5PR01MB12500BC6F9EF1139A0FF5DF0FFEB5A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 23 Dec 2025 21:17:15 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Dec/23/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <804c8023-8a14-4b74-838b-4922c9609ab1@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA0PR01MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b949f4-511d-4bd0-4be1-08de42259971
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|461199028|5072599009|8022599003|23021999003|8060799015|6090799003|19110799012|22402599018|3412199025|4302099013|440099028|10035399007|1602099012|13041999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmJpdXg3YjZzR0RrRVFmYmJMVjBHOVRvSExndGtqNlJsNTNDeGpSNkpabmN1?=
 =?utf-8?B?blFNTEY3SHQ2WjZCN1ZCV2JUU2JjZ0dWQ1U5L0JwcmU4UnRGc1c5S2M2cmR1?=
 =?utf-8?B?bnZKM0lhUFFGQ2ZpNTZYQUJrYnVmdkhGRFhiZHh6cFFjVk5nZ2xPQ3VGd2ht?=
 =?utf-8?B?SlFnaEh3YmpETGIyTmRNeUxEZHVkeWlnVlRmSm45MWE4Q1l3RkdLRG01WkQ2?=
 =?utf-8?B?SVNGSzdxNUNDQXJMMDhaVkxIRXlDUHVUbWt6N0s1Z0VYV2xYKzd6MGFYVGw1?=
 =?utf-8?B?UUE0WXpNSGVKRUFvYnZiTVRHaXNyd1JFcXAvekFtb2d6SjRGa0Mxc1dyRzQy?=
 =?utf-8?B?cFBwS3FXVnZYb05iNnRhS3RSb3ZZNFo3WlNUUHZYQjQ1WlFXQUFyZVhocFV3?=
 =?utf-8?B?emg0RDl4MzdrV0c1RDMwWHpwNlVpa0JsQkhFNHV3a3c4SkswdDZtTXNEWUEw?=
 =?utf-8?B?dEVvM3RyNm91VGRmRCtNQ29ycEhVV0hib1RPZG1EdVBoaytnU0Q0K01Bd2Fr?=
 =?utf-8?B?YmN6Z2tIS0dFWjBYaFBmcVlnYlYzenBoYzBoMXdpaENiSEFTWjYvSjlpYkcr?=
 =?utf-8?B?Zll2UmprYVRaQTYyOWNVdkYzdHVqRjVIb0tIU1J0amczdyt1RGFiMFBuMG90?=
 =?utf-8?B?Q0pqVHo1eDRZRnBadVN2bTVYUW9hV1JCeFo4QXBGWVlZL3lEeFBHTmEveGp5?=
 =?utf-8?B?SGNGbld2SFpscE44aVV3RzRGRStHMVQwNXFrMUlEaE1XYit3cTJrYTVEdWxJ?=
 =?utf-8?B?elhvMi9TMjZLbElwZVJ2Q3VvL24vaGt5WGNLdXErWG1qcmViTVdlZTdTcUlR?=
 =?utf-8?B?eit6bTAyenlxclFGd1hsUzVabDQ1MXZnaDZWZzRubllsWmRmaFJTRWJJbFZh?=
 =?utf-8?B?bzZoWUtzNjVOY2xacnlWdUpLaXV0NWhmSHVnOVFabHlvZDFSWlRVd0dURGEy?=
 =?utf-8?B?Sk9raFNJeEpDbDNUcTlEMlF0bmZEZUdXbmdDMEgyaVhxS1FwOXJla3UrMVRO?=
 =?utf-8?B?M3BHYnNtM1p3SUpFTU5SMUFCRWxpdW9zL281TjRzcDd2VmtwTEdVTVBiSlU1?=
 =?utf-8?B?S1ZCclZSZjc3Smd4cllIK0dGZU96L1h2RENMQTJWVndPTVp0d0VkTDB3Z2p6?=
 =?utf-8?B?dXZZK0NJZVUvTUczVFlVbTNaaG44Z0w1UFNONWkwR1A0RVBWc1FHVGcwUDlv?=
 =?utf-8?B?M1ZxOS9iMFc1Mk1xcTlvZk5sbWF3T3EyZUNTTkd4WlZuZ0Jhcjc4RXNrdXFt?=
 =?utf-8?B?M0pmbCs3aWhyN3hpR05xK2RJRXJRcnM4bXdxeFRBNUxRRGZIeUdNb3VoR0Rk?=
 =?utf-8?B?MmZpSFdKWkhvcTlSZWFucXViQVJIN3JKanRQNUtFY3NBcGNTZHB2cEdSWHd5?=
 =?utf-8?B?NlNNZjRoTFBIREpFN0czNkFxYXViMjhGUkVIaDJIK1ZKZHA3dmR5cE14YUY1?=
 =?utf-8?B?WDh3dUt4OUQ3dXVwZFpBa2dialRmbGt5c0VnUWVwei9kcmZMYkowS1VVYzVN?=
 =?utf-8?B?SFhWdVJnZERTS3p0TkUvQURKaDhSYzJjSjhHMHlwSTNhdytqbDlUSzBLd2hK?=
 =?utf-8?B?Mi9uMEw2bUlBOU8vU2h4Z0VRM3dudkZCczMwa0RMM0dlYTJVYW83ZHI3Yk1B?=
 =?utf-8?B?VlFCTUVnRDRzQmlXRW12SERBcjVLZTRMVG9Ob09keEVsNGloWnk3b0VlNHRh?=
 =?utf-8?B?bW1qTEdFaXNzZnFHSmNjd2piT1BacFZqZEY4QkFYQStTeTlkL1JTNWg5VXhh?=
 =?utf-8?B?UHpRTVU5SGhWbnc4bW5mUy9QQ2ZWeHBaTmNsVjdiTlVZZng0OURxY2JxbFdv?=
 =?utf-8?B?cmJITU5ZOTZlWG1qUUdiUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWw3em1zYmNlVzUvcUJreTEyRFFNRDVieWpWZDRBTW40bUJLVjM3MjdBVHhr?=
 =?utf-8?B?K2hsV2gwWngyMTF0d2V0N1dDTWpCQThaQjZlS1p3ZHlCdGtWc2VFT3NReDlh?=
 =?utf-8?B?VmUvWm5oUlYrOFJ2a1BqMTgwbEp3aWRDenU3WTBqS3ZidHZaMFFTUk5Vd0Ur?=
 =?utf-8?B?Z21YOWxUR2k4MkY4MFRpWlRET0pIeUFPTTJwSkZmNUV5NndOdW1QY05Db3N3?=
 =?utf-8?B?V3N5VlBvTEwxR2hSVG1CS0pHTXdCSjFBZXErbnZ6V2kvN2t3U3FkenlyNXN2?=
 =?utf-8?B?dklpZUtqWVRPUklMdEl0RUs2R0d2dHYzRkdPNUZCNVdQKzQ3eW1TdWZKRUlX?=
 =?utf-8?B?Y3FvWjRGZzlMV2VNbzg1bVdkdjlkb1ZJc29MY2ttb0xpSHN3TEFLUVZ5ZW4w?=
 =?utf-8?B?TjdQQ2ZXMHYzT0JYdEhBZ21ZYVdSRFJoREhsNkh1czRXdjRJblhhdzlHdkJh?=
 =?utf-8?B?SzNXckhyODUzZEs2YmEyQVYxVmhYY1BVQnk1SzFoMmhRWFZmMEN2MllTcnJo?=
 =?utf-8?B?M25CdFMwQUJPbVkvVStqN2dZK2FmNjZLQWZtYWNaWTRyQ2ZwVUorUWRLOE9j?=
 =?utf-8?B?RjI2L2NnSTNSSGpyT2hNMzU2TXlGb0pBY25qRDdDd0QvV2pQekl0dWw0SUs4?=
 =?utf-8?B?NmRXZkptdWVWNFduSTFZV3JDSHZHOE54MHZoTmRYUk1Rd0dQcHJ3b3dGUGNk?=
 =?utf-8?B?amEzR21LUVRCOUxwV3JUUGpvVlFKZmRTaTdBeDJMS3Z0bmlCbEJFVkp0VVVk?=
 =?utf-8?B?VExNdzZjNXluZ3g5Z2QzK3l4aVUxbzF0TkdPcU50REVnaTRJbzRYVmZEY1Vs?=
 =?utf-8?B?TlBKVDBTNUtXbG9lWU1LNFNKcXNpRnhDR1JpTlp5NE4zVnBBMk5pK1o3ODVX?=
 =?utf-8?B?bTYrYlJkWEhnWGhkbHdocGtqdG95KzE5NHFUaUdzTkpoeE5Odnl6ek8wSmpj?=
 =?utf-8?B?elVKUDQ3UnpvTUFMNUIyN2xjRThFY1NLUWFscE9va04vUlNDVnU2NTM3VTIz?=
 =?utf-8?B?Wnh4OWZzRGIydTRqckdNVlI0eFRnRXdscGVHNHhQbWZsT3VqRlA5aXFMbUo0?=
 =?utf-8?B?alE2RStmS2pDOWhsZWd5eFk4NFRkVTE1b09xVldFa01BYWxTdUsvd3h3WDU4?=
 =?utf-8?B?NGNmcUs1cEpXcUkzVUlCZGhnQWNXOEhiOWJXKzEvZ0c4OGFXYlZhNTM5eDln?=
 =?utf-8?B?OTRvSXNITFlPR2xqMCtxV2liNUhKaXNzUmpwVDhqbmV2Zi8wVmJQNjNkTWpu?=
 =?utf-8?B?dTR6ODFkaWkyRXh2MFc5dkhtTzJsVnhMQU1iazBPcCtEeXRLTVZRYVRhMWh6?=
 =?utf-8?B?R0l1Q3o0NEJzakp2YldKL0R5czlUbnZzN0l4SWRpWmVGYjV4M2VsK3J3alNv?=
 =?utf-8?B?Qk8xcUdvdk5LS0dVU0pWK0lEOCtpQkRHNmdVSENEVmZzTHN4a2R2TldNNjhC?=
 =?utf-8?B?U3ZETnJiQUVGZk83VWozamkwOHdyUWtHenVWYVJVaTJoTUIwR1RKeGkwa0l0?=
 =?utf-8?B?bGpCdDhtNFVPSm1mS0VyUjhmN3dJTFlzS2hUNEM1U24vanhGN3plM3A3cGdE?=
 =?utf-8?B?am5oSXVTeDIyS0VKNFh6M2VsRGVlWURRLzEzVFBDNjRQaWY0TFZMOEY2cmJx?=
 =?utf-8?B?b2R5a2FoNlRGU0F3Mi80MXBldjh3NUZBUThMQkRpY2lXbnZLNFFuN0w3c3g2?=
 =?utf-8?B?akFTT3RIck9VOThteit3U2tHeml1NWcyeFptUUl1SnJRdW5JRDVGY0RBeDJN?=
 =?utf-8?B?a1N5U3dmbWIwVm8rQjBucUNPSGQzY3ZvT1ROcVNncngwQkYzOTZYL25ucWVS?=
 =?utf-8?B?ZVRSZHVXK01RS1l1SUlTclRDZjNjSjVDVHliMUFpcVg1QVRiSWJ6am5SejYz?=
 =?utf-8?B?Q2pXTUJlUUxJUWUwQm1lWFhGM3dJcmJVdjVGRHZHZGxMTVg4MUNQeWNZRW1P?=
 =?utf-8?Q?MLSjDg0ITvXNoYvJiHDvwKsdnz3iaTJr?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b949f4-511d-4bd0-4be1-08de42259971
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 13:17:21.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6360

Last updated: Dec/23/2025 @https://github.com/sophgo/linux/wiki

6.19-rc1 is released, following PRs are merged into master:

CV18XX
- Top syscon

SG2042
- PCIe driver DTS part
- SPI-norflash DTS part
- net: stmmac: dwmac-sophgo: Add phy interface filter

SG2044
- Fix incorrect use of bus width value macros: v1 and picked by 
spi/for-next, expected to be pulled in v6.19.

Some new PRs raised:

CV18XX
- fix USB dwc2 FIFO sizes: v1. Applied to dt/riscv, will be picked in 6.20
- allow DMA multiplexer set channel number for DMA controller: updated 
to v2.

Merry Christmas and Happy New Year to everyone!

Yours,

Chen


