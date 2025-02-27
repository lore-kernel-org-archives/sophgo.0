Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011026.outbound.protection.outlook.com [52.103.68.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374281581E5
	for <sophgo@lists.linux.dev>; Thu, 27 Feb 2025 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740627319; cv=fail; b=ZEHClutMsudk9u44iPeCK5woNQgXFH3Ul//nB8i+sNpD4IaLkX/rBYI/I6821fGHjzag5lf8r35NBThXCO8ag6PTfBLqg0ibI2pbPayI9f+uh2/sUS2R3OVoNDI4cL3zE4G5VO+V9C76oaKPwTFb/Vg37yfUtKXO6zqN+xmgUxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740627319; c=relaxed/simple;
	bh=0IIrPfkvrbs3eLqe1VoQhcu4K6DdjMyozi3KLMrrrB8=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=rr9LWwMZI6D/Nxp6MLgfrAwLug0BBPfTf0vo1hGAKnQLfH1cyRNPDpZFBk9e6wnMlk0rlUJ69p56vCCr+D3+yOLiWocJGZEprnd3LQAQWNC7C9N/MQpD1qzsPtcFE/mSRRenKKquPwESNBbXk4Pk/dYz9pYibGb8o6fGuoRfzLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Ovb24deP; arc=fail smtp.client-ip=52.103.68.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Ovb24deP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9D/U7doMtkVWDasGsDGreAZCIfKsu89H0IzDg/RJTmr1bLb3lksv3DqH871pron1DLJWd+T7joZSggEqUr59YlLb5m2y9naJcKCDtjqyykGy+wz+TnClYjcUtGBp/rRbZKOwyxhzuejejpZrnIgUONYfdeXNAQJbA8j0LEfQzI2cK+I5wJWu2m5HrkO96bbOsAyUw/zNLOIzp/X15IhyxBlsmuX79CnpdQJXQDXZBO/9A/QtTstUZgCgGmNZG/XkbYpsueL6DyuxsOBmhtLV7zLy/WGkMaVMZz1TFpiPaadRfqGmDNJGLEuDRHEleOm7C+iQhRB826YKhi61KvFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrMc6n7kGbZEH8d4CE3E8dYPhBhWiH6OjYUUolX6xCY=;
 b=yMSRdhkU3jbfXyWV5qvykr/u/1Vvv3y7M3Lnvk/kiDXSTG8Q1ABqE4LB/wZisZdWnMKcpoMSKPgxUNZAyj2MVdAXC8/wmbgrdCCH4TRPW9Svo3QGVWmhkhy1o+b2bSeCWZEh+wf0s7LWv0XNQtMEF/UO+zZd1gsxfNCAG4rF0XyYdd83CHvIfzgIYQaUyP1rVLjLT1N4/LwE8dG54vnIEjzDlW3uAZ7SZBRTz00ATEGoznIQYF+Ov84kK5YtgkkDWchmtzVTXauqjdpgHq8IDJRhUnk09KIkuXISPGo3FCwJDiQnrXB6XuXiA+CE9mUS0cI5m3yrQR+RXToDR1AIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrMc6n7kGbZEH8d4CE3E8dYPhBhWiH6OjYUUolX6xCY=;
 b=Ovb24deP8RUtLSCUfYxWI2m8fX5piYHe4LNd3aw/+CayELyF5MhPh6CJO2JxAZZNtHDQIlTOW6nbYlUjfXS5AlK6Ju/c812hUiU85qZMoYlzboXxw0L1Tnc1zgtS+B0S6BsLb4ss0GImL+ho7rP9szzrcZo+Qo5cM7mTyOsJuE0V2DYBniJrhAelph5/EzMGSZlwPizHWhDgAFgPjlNldnYI8HjKC5A/K157b90Brbh0vcrhJoEGj0Y16OaSGv2zB1lcZZOIIME6Oe/46YjwY1luPse54EzpKPu0RQtcK3nGG07mSBpaQHAIR7QQORz7j3xFHtNytxCWShH6uZzkBw==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by MA0PR01MB10144.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 03:35:12 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8489.019; Thu, 27 Feb 2025
 03:35:12 +0000
Message-ID:
 <PN0PR01MB91664CB8D135F28CFA46C32CFECD2@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 27 Feb 2025 11:35:08 +0800
User-Agent: Mozilla Thunderbird
From: Chen Wang <unicorn_wang@outlook.com>
To: sophgo@lists.linux.dev
Cc: Liu Gui <kenneth.liu@sophgo.com>, Inochi Amaoto <inochiama@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
Subject: SG2002 TRM v1.02 is released.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID:
 <dc9ce636-078c-4fc7-9c60-d5d59171c54d@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|MA0PR01MB10144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef89c80-4304-4857-e5e5-08dd56dfbdf0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|5072599009|6090799003|461199028|7092599003|8060799006|19110799003|10035399004|3412199025|56899033|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3NtRVg5RGpXUzdXc1VaQUJaeFBleTlVVEFFeHJrUlBjQWJubWhWakt4MWNP?=
 =?utf-8?B?R0RMbE1sRlJjc2pjeWxnOVIrT1JFdlFLdzYyRGZQNzREQUl4VUNYL0tNY2FX?=
 =?utf-8?B?THE2YmNxTWRWK3lFREpqbHJGWVhFS2hJNVY5OWQyODE1OEpUQXdiRUJZdzlx?=
 =?utf-8?B?WHd3M2x0Uk9ZL1JjVVJEeDJldC8xQy9WRUNjT0xLcXlCZDNTQ05JMk1vTTRj?=
 =?utf-8?B?L1ArV29NV2FyLzV5YzQzVFk1MklRRCtzUzZHZkVmWEJuWHJYZG44aThjMjB1?=
 =?utf-8?B?NzR4eXVHVVRySGJCWnliWDBIeE84VnFtZnRiUTJmelJWZ2xsT1JwK2ZZdHFZ?=
 =?utf-8?B?Ri9Zc2Jna1JsRWFnd1krdzdDUTB1bGZWZlJuRmVKdEdKNXNraTl2YUg4ZGJj?=
 =?utf-8?B?ai9TbzZWYWFreWM2WWwrdmM0QlZIcDJWRG05L0w0amo3ejJzMS9TY3hrMFRP?=
 =?utf-8?B?anNMRldrYWN1KzF0TVFYek1iMFA0cVBoazJWeVA4UldzVWxJOUo0UE9NT3JY?=
 =?utf-8?B?TWtQM2xXcGhqL1RmNm4xZmtIZXdPTm9jM1hKYm55RHZ0MFZNWWx4NUlscklq?=
 =?utf-8?B?U3BUR1BKTFBLZDdhYmtEUnR2c25NY3hOYVoyWVBqZTl4Vzg2WTdHTzhKVW5C?=
 =?utf-8?B?WHJEd0IrVHA4RU9nOHZaRDgrNTJpNldNQ0xWMEs5ZUtESk1BUzErVVFYRjhz?=
 =?utf-8?B?eExXdHdseWk2WjVmYTc2TGdXNGdkVG9Qa1ZJcGZvZW1CdG1KbGwxMys3N2ZI?=
 =?utf-8?B?N0UrWDY1RTU5T0ttZ1lQakYrNHpLcVBXdE5Td3p4enByZk41cFlrcjFlcW91?=
 =?utf-8?B?TUxNMDhNQmlodTFGLytUTVZwYVJxZ29tWG5PTDhYNVk3UFNtMmw4MEY5Z2pr?=
 =?utf-8?B?MzJQMUdkYzJwcXQ5eVM1SmVMdHRuZXJJQ3FWYmlTQ2szZ2tlR1VkY21KQ0p2?=
 =?utf-8?B?c3FpUWdyZkdUaEdvcGNiSlUwRVJ5Q3RHTHRWZjZDY05UdUJZZ1g3dm5GNEpR?=
 =?utf-8?B?S3dZTVFTaW1rQzJ4UmpzWU5pcU5LbnVSRFdSaEJGNlBuTnAxZHJUbjNuYWht?=
 =?utf-8?B?WGtNRThrUzZKL0sxRU9nTjhZYmpaeEtvRFA4UEdjRFN4UkE3a1hLVUVJanRU?=
 =?utf-8?B?cnFGeGc3d2JxQWlLbUlVMlBaSTRDdGtnanBBWE5yYi83UzdxWmYyZERsVTdL?=
 =?utf-8?B?d0I4a2UyR3I3TnBMR2VzeGNSZmd0anBpNDNKZTlIdWFxUlBjZ3VTYzVoN1BV?=
 =?utf-8?B?L0RzNHFZRVVMdTFiL3Z5cW0vdklNbDFySFBhbXpQMVI0MStCTDIyNENWQnFB?=
 =?utf-8?B?NmFhRXUyMnBhUk8xNXl1OGtzenhlMlE5L3lMZ1hxS1lQQm1uSnlRVlRmeElE?=
 =?utf-8?B?Qmkzb056NnZ0T0VVcnkwVXJBTjNxWkZqK1IrRXdRSlhQT3BaSERTTVYzTmov?=
 =?utf-8?B?MGwzWFhTT2d0RFRlSG95d1ZzRmFqaWNTNVF0Rk5zZlpDalF2cUg0ZHQwZzZD?=
 =?utf-8?B?S3A4SUZ5QlNPMnE4clJZdzZQWERVYjNlVHRZYS9NNHBwVUlHNGZ6UVErTGJT?=
 =?utf-8?Q?VCPaeEmIZ1FIslvP48S37pdjE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDA0ZnpvRmZORmhpejdHazJFSGVsT3poenF1RmdnZVl4OWVpSityekR1NXMy?=
 =?utf-8?B?Z3lGTGJUSUhuOExsZ0RibVlvV2ZpQWx1NE5va3JMSndSdFVnUWRTQVdzYk5y?=
 =?utf-8?B?UlEybVRLcnl1VW1IRHdLYW9iTENYODZQcHdWbTdjSlZtc2pSVzZXb3VORUNm?=
 =?utf-8?B?QTRnNlBjeXM5S1hoZlJVUXg1MXBqcVhxcnFKRzdkdzF6aTNROGhsZlNtcU5Y?=
 =?utf-8?B?R1JqYVNGUUVmZ3M4SThpQjArUjJXOUpKc3dTdXYwQmJKLzJoSFdYNjFEOEJQ?=
 =?utf-8?B?WTdiR0RZTnFxTS9uL3M5eDhRZ0xadWdGMUJYSk5QMEFzME5kYThmOFNmdGhL?=
 =?utf-8?B?YStNWGJmQ2VQejFiVGZkVTNjMUY2amsrZG0wLzBlTm13V2NQbmgreG0xYlEv?=
 =?utf-8?B?aFlzM2tSYVdicnNhZGJqR1B0VjJlUFAzK1A3VVF4NGJ5THBjLzNFcUxicXQ0?=
 =?utf-8?B?WEVLMnJVazI1a1hsOXA2SThBODI1b1FoQnI3MUJQdTg1T1I0M1E1a0xUVkJv?=
 =?utf-8?B?MWphcUZLRExTMEVvRlg4VG1YTVpmQkNQaGoxcW40clFxRGsxem9xa2pnd2lz?=
 =?utf-8?B?a2VuMkJGTC85aXJiNEFWckZ2SnZHdVNkdEVJNlNFR1VaZkgySk5hYXAvUUxM?=
 =?utf-8?B?SnAveTJib1VWN3RPNnR3cklVSzJUWk9ESTNUdVVqU2tnZWQvUDlEa1V0YWpt?=
 =?utf-8?B?amwzcG5aYktJWER4bDZWYnZYeE5MdUF3UXluT3p1S1N1MUtsbkxpOXdjc0w3?=
 =?utf-8?B?ZVNMa0ZWa3hCdFQzNjRodldXMUt4ZlBBN1ZwSEpkWHYxYkUxUWhGVFFxZkFU?=
 =?utf-8?B?NFNWWThUaS9CZnpzTHhuOVZMZ0o0enN3RzVpY0p5UnJ3N0drWExWc2NJdVZh?=
 =?utf-8?B?VllBR3RENm81THRzbUlCS1RlRXpMb3VCSWhPRmpYSWJEaWh2MVV1RTFaMit5?=
 =?utf-8?B?eHBaRnhuN25FU3FianBxZmhPdGRFYlhZdGxZNzJFd0c2VlE3OUF2Mm45K3hm?=
 =?utf-8?B?NmZZSXA5UVRFK2lxZGc3bUJHb0ZqaFZlV1FiVm1NQ3puMDhTeDNPTEhWcERW?=
 =?utf-8?B?b0wxd3F5bHVNZVdyOHEydXArS0RrTk5RcDhmUGZFalZKcGhONHl6UVlFNDZh?=
 =?utf-8?B?bUZGOW5WTlp0eEJmR3c0aDBRUkI5SmVPa0hpVTA1b1pwSDZ1YmJEd3BYcmpJ?=
 =?utf-8?B?VGk2L2hSTUxzOWUrREtVUUJ5WWNEOHBYTTB0d1dYRGJCRXozUHRFMGRJU2FS?=
 =?utf-8?B?VDV5RTBQZkRHOTBPRm05OFhCMHVrb1RQTGlDYm00Q1hiTDdXYm5pODZEcFRs?=
 =?utf-8?B?bTE5VE10NjZMZGNQYWQzYlBtNVUwNUFpMlhyR1B0U084L0hQenB1T0tsS09Q?=
 =?utf-8?B?WGlKM2xnK3prOVZtQm1TcWYyQzJ2UVR4Y1VTWFBTQ0xqeWN0SkpqbUxkaG9a?=
 =?utf-8?B?SzM4MTFNS2w5UG5taS93TDVtZCs2b2VHZVFsYTZ5cWN1Sm0wc0VvQktOQk0z?=
 =?utf-8?B?bnFTZGpmd3FpM1lBdkJ6TEdSRllQN3BoSEkyb0lLQ3pkRGtrOGQ2aEVGRnVD?=
 =?utf-8?B?MUVxT0lkQ09OY1lQUE1KSWNQVFo3WFNMOTViMEljMWU2NGtvVk5CUmlqV3VU?=
 =?utf-8?B?TWROV2o3M2NkZFN3ZVFjTlFqZ2tuWjl2b3NhTU1PaHhURm1wK05nOEVaTmRB?=
 =?utf-8?B?U2I2RmpSRGpsa2x3OTU2aUcxVktCRytQNnloUUdYdFBsMDNjRjRLL09Jc2g0?=
 =?utf-8?Q?j4VBKUVA9KRIYCSCgGY5NGnsTdw+cXOFT4CM3iE?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef89c80-4304-4857-e5e5-08dd56dfbdf0
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 03:35:12.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10144

Hi, all,

PDF documents and more info. are avaliable at: 
https://github.com/sophgo/sophgo-doc/releases/tag/sg2002-trm-v1.02.

Any question or bug report please open issues at 
https://github.com/sophgo/sophgo-doc/issues, and being titled with 
prefix "sg200x: trm: " is welcomed.

Regards,

Chen

