Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011033.outbound.protection.outlook.com [52.103.68.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE4B640
	for <sophgo@lists.linux.dev>; Thu, 16 Apr 2026 02:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776305582; cv=fail; b=PeYGKV/aiJIn/PCQs4OywdLN4NPjapyR9Bwrh/MqK6IF/Tj5IFH0otVuX7tHEOLCFYD9oFZV3tvmvqP1+xJa8uUiXWtcg19Ei7aED56cDzLWS+Ti1lZvgHzpjYw8V44NTlG7kngMK6rsRqfRoFYqYsNP17G8SMWEZeIBNBZPh5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776305582; c=relaxed/simple;
	bh=LOH5Jc25KnurDdnQtg6TQhVKMA7hpgwy0PEPAZghhd8=;
	h=Message-ID:Date:From:Subject:To:Content-Type:MIME-Version; b=nHhtFKWpsm+s0bC8jp9qM5edhJwb9sv3YBi0uVeIO4N48vi1ske22MYn/enFEwnQI5HGeiJ4EUzLLhvQS9hih2xzow+S2bFoypCQMdbygZbX9yRI1/pAV6dS8pR50sIvuj4x4lzAvDe7ZuP+HDb9Xo9XUIjubNx8QpeXRwseCIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=A20fFTV9; arc=fail smtp.client-ip=52.103.68.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="A20fFTV9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOLFaxRsfrP8YBUJhxZgo2idur9RS7k14PZ1YClHWr+tAx/rFvC5V0JBTPUCfa618QmPVKCeGQ5tRPrzfVDnJELaH6Xmh+Svbi8tlgka88fW7vBwMTlmqYbB11xGcsOT2Y5UDOsGHUXvM0ThR4vgg74lySRkoDJJbVltzyMUyIwCgtwemG4WVkZI74uspzzcbyDP9CBoazkWZ6QZivXrT4fzgxPfC1dLbDx/sdeF7lPIn+qbnm0CfskAg7IldIukaJgKjYI6YoNY2llWIK/YRvTYl++lNc4RWbvmepkCsMJDvcWmoI4RaLOE6YJT+tioyjLrUW9SFf00ucNNVuGuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgV82HBa13wckmgA2FDvpzmWltEobpJUypAOrHUhACo=;
 b=Y3hfYGbPa0+VWSX6ISprSKUuT4feACKXc0HnqwK0O901sLZl7tTmKXhZJb6+Uj8c8PzrSJVRFgQHknvVcnglGOxoMyUe/eEQ5yUaU6inD1brZ/7MCKxUxyRS+da2+/3pGgJFx6RoTYfTrmP9Xi7kf7/T6bJZSNxaL9cE9ZUoQgoIt2fefTbMmwfpwzGOARxb8YOGdY/sLfpyWyl2uU7nN7yfG14lXqfBRUAbE9L1N7YjKG9AqLqkUONoVWgQTj0882Ktk6cYbb25kgOFuTPssmpZpDKzNXmcH4sWOPWJH//M/0GQD37qjO/VuKnz5h8o0bAXV6wKNy28GSgXYh4wIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgV82HBa13wckmgA2FDvpzmWltEobpJUypAOrHUhACo=;
 b=A20fFTV9wQND4f87UmDIw+PuiOW/9rVdyAtchyyNJv4x9qxy0VlqJR2sZrlwVdjleZaJ8YeMoZkRBYP/KcC293+yGXgfNde1gwDqvbFBgOQ0IGlPO+swwaKk0/XBPRMdZlZlVYWX9SEtj5tvDhbKZUaufZm/Wj5FVaWWhxiFj70u7kEVJcztWI7hMf3SNwKh0Hkhdzy7As6qAy2/zCtakc7t0v2Hw+Q3/o4Mz2Tm+a78eQbaQsTi18RUWtpAfXX0tjSB+29xJ2E+AD2B4MK04dtHrzSrAJZLOwdacMptutz46/fJkGCvV0R5bWObThtHXAwIlFVwn4ckmVGNeHwjaA==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB5435.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:7a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 02:12:56 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 02:12:56 +0000
Message-ID:
 <MA5PR01MB12500033598DD7D4981ABD3A8FE232@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 16 Apr 2026 10:12:51 +0800
User-Agent: Mozilla Thunderbird
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Apr/16/2026
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <69049f4f-af4a-46da-8f50-797b6fd0ffbf@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB5435:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5e218c-1a57-47be-284d-08de9b5dab7c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|461199028|22402599018|41001999006|8060799015|19110799012|23021999003|22091999003|15080799012|24121999003|25031999004|6090799003|5072599009|13041999003|1602099012|4302099013|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3Qzd3B0SzhHVEpGclgydU5WVUNyeTBOUGY1eG1IV0tldm02TzdoT25Xa2Qz?=
 =?utf-8?B?alVadFpmQ29XajMzdnAxbnQwN2luMWxXczQ4NUZjTXRVTmNWUEJWT1ZqaUZL?=
 =?utf-8?B?WTFhOTExUkw3MUNzR0orZkd4QU9BSWRhbWxwYTZoRHZ1dnlLSW1VYXpzYmY1?=
 =?utf-8?B?QlNvckRha3ZMNDMvZXpxTm03aTl4UDFUMW1KUStYVWVyc0MwVnZoY01VaFdK?=
 =?utf-8?B?Vm1EVCtNVnMzSzU0NkNLVTVLWWtRTXJVK3MxK3p1cFJQSGROTVFpSVZ2TXpZ?=
 =?utf-8?B?aEFwT0NaMlBTNnVreEIvNDJaeVdSNG4vdDdjVkQzSG5uaDhkWmk1MGRuRFI4?=
 =?utf-8?B?cEg1RlcrdjNweWJleWlPMXFRMkV4djlCV3NrTUhIaEFKdCtlekF2bEt5WFpP?=
 =?utf-8?B?MGhCWkN0S2R3ZzY3enJ5dzVWUm1Pcy8rc3U3NWZ1ckNpbzllVklKRGhWd0lX?=
 =?utf-8?B?N0hBL3Z0UStXd1dsUWllaWVKcE1hUmFRTDRZTHdBWGpSY0RtbXd6alFMaUF6?=
 =?utf-8?B?T1VuQm9BcThHQ3I4ejVlWm9CMlRBWXZ5SEo3a2MzTW5lbHljanluVXF5MlpX?=
 =?utf-8?B?aTRKaXNYRUJzc0p0c0RETUcvM3RmV0dQMUhIaHMvU002Y2JueUxadGczZ211?=
 =?utf-8?B?Yzl2UThNTzNSWkJqeDc2UDVpUjhDdjA3alZOSjd1Vy9LTFpqNituckdwb3U3?=
 =?utf-8?B?SlYyazluSTNPL1A5b2ZiN0NyWkFMdXZsZStMNzRCdnhRbHcrQVJhYnk3a2Va?=
 =?utf-8?B?Y0g1QTBORlI0cWpSNXVtZEY1SHpKV3ZVcDlpRjZScTlOODRUUWV2ekcvZXFi?=
 =?utf-8?B?MjJoU3lzVHF6aVVRZDhvWEZlaDZYMXlsRS9oUUJuU29iWEhZK3VRcExNTDIx?=
 =?utf-8?B?alhzYTFMRTRTZ2dqUGlVbGRod2J4WWZYbzdJMVpma0szdTNqYUdWMm53c2RI?=
 =?utf-8?B?V1p6NXBKOXplUzBYeWh5NWxUdUpkdEpFemxwQlZkM3pRU1gyK0VITm5TTUgz?=
 =?utf-8?B?RmxtTi9yazBPY2VXSHBsczU3N3YvZ1loQWxLeEdwM2VnQkU1U3YvM0JPSkVu?=
 =?utf-8?B?WUJBSVFuV01jSzAzUTQvaHE5NWhXRHhCekVTUXhqd1ZJTHpXS0hEYmpielVM?=
 =?utf-8?B?aC9KTm02eG1CekY2dlNtYSs0eDJDeG10RitDcDJza2p6bjdrVUhMLzdIdkxq?=
 =?utf-8?B?Y0Q1eDNvRkFkMFlzQmFRbWlyVWdXYnpLL3NPMmtrZFE2aks4Y0RpWGN5NHAw?=
 =?utf-8?B?cDNoMkl5U2c4OEVaUDNKNUF0d01uM1drLzBqOWljeEdxcGVQaWMrdFRKbU1T?=
 =?utf-8?B?RU1WSUNjejQrYmVUNXlyV1laVWJDdFRzVXVkQ1UwU1dsTkNjR0NCaTVXeFpT?=
 =?utf-8?B?eFVVZUxNZjV1OWs4VVFLQXJLRmdrNW8vamVIQlFiTVo0UDVRSVdnSGEzSCtO?=
 =?utf-8?B?bjJwR2pPTHZmZG9yMmVzWXdkMXZkQWhhMStSTDkrd1dISXd0emxhczZmL2F0?=
 =?utf-8?B?WGdlbFhmdVBnL21KY0VSaDFJZ0FYdlNkam1JOCtEQitBTXFvUFpaUnpvZW1m?=
 =?utf-8?Q?t1k0kncn7M2UYPkEI/5KdQentg1bGSM+MxLvaU1Djdy/5S?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVoaGtEYXRrbVNNUnh4SFZ1TXJhc2FMYjQ0UGs0VEkxN1VITGhxOXRrUW1h?=
 =?utf-8?B?MnM0UGNNVENBM3hMcjZHMXpsVy93N0F6eFVDTnRyRGIxTnlUaWFvbE1YRDVX?=
 =?utf-8?B?cW80TW1oWGtLblh5d0ZaM0dkbnNybVBIOEY4ZThGQUhiZlVnQVJYSDl2S1Ex?=
 =?utf-8?B?RGg0b1VadkdnR20xYVFyUU56WjMycEpYS0V1RURxb29OUHkxSmRzUEIvMjlS?=
 =?utf-8?B?VHFQNzd0dGVBaFlkSTBydkVwa0JmRHd4em91TFpEa21sMU4vdHdJZkVxT1Ns?=
 =?utf-8?B?R2VlWm1LOHhLTll3UFdZMEtjUEFsU0w2L2xJeTFGcXVMSFRISWpIUkZXL1Mv?=
 =?utf-8?B?U3EzN3pFVm1vN2N4VUQzQlVaM3I5cVRZNjIrbEptS0dxU1NIaSt6MXg3eFhC?=
 =?utf-8?B?ajZmOGl0aExCamxzQnFjNkpJZ1NKNkpFNmtRakg2UnYxYXhMYTBIVEdpcE1S?=
 =?utf-8?B?VVh0T1U1cklvVTdRYmtzc2RkR2xJUnRZY1BwVVNqcndxRG1FTHF2ek9lYjlr?=
 =?utf-8?B?bjFacVVqdGJkemN5TUFISm94Wi9zaW5IbjRManlJWS9tMU9CT21PWjZ1MlRY?=
 =?utf-8?B?dGI0VVRlbDMzUVZ0a1BWeVRzRXZENnVEZG5QRWZTK0JYZkt4K3N3azE3NHpE?=
 =?utf-8?B?UUxNU0txcGR0cjh1OGhLMFg1ZUF0dmhRbGlDU1dZajJnRFNYaVZsZEE1WUxp?=
 =?utf-8?B?a0F6UDRaSEwrRmlPUi9IL2QxTWNhamNFWEJHbzFTSUg4UGxlRUhHd1I2eWkr?=
 =?utf-8?B?T2RxOHh3eGpZNHNCRVhmaC96WjJJT0dWVk5RSDI1Uk9mZ0hDMEdSSkZENXVS?=
 =?utf-8?B?Mkp5SFp6L1pMczNCSmpLbG91ZTQzRzZ0czRFUXJ1ckxCYXpma1JXdlNPWTJU?=
 =?utf-8?B?OER0QXNRMkxwdStYdHU5K1RaVzJleXFpMXBMNTVPZFNVSG04Z3p5V3hiaFl5?=
 =?utf-8?B?bmNCWGtFS2FMQW83dU5nakV6bVV5MjlHbHFIODJmVi9oN0hYL0hZdmtYZTlF?=
 =?utf-8?B?LytGcmlhRVk4VWpaYXFhWEZTVVI4cEpkUHJrWE9DV0pVNVBvakVMSDJrR1lu?=
 =?utf-8?B?N0hyZjhDWEpwWHE1OTQySkRkdVI4cHliMXE1UTV2UnJIaUc3bklXbzVTSk9U?=
 =?utf-8?B?VExXQlRUYW5hN1l0cFArcmlCVDM2akFoV0E2ZW05U2ZnUmtyeHlKczBFTTB0?=
 =?utf-8?B?MU0vVTJkY1RIKzBmVGlIdGFuUHVST1BBUzQ2RFJwTEE0ZnB1MDVKNk41djFK?=
 =?utf-8?B?bjl6S1pCMTd5d05xa1lOSGVwSXZ1bWJlL2dCcmwwRWpyWUlkblJMdUlFdTlv?=
 =?utf-8?B?UkU2SnVzV1Evc1cxS2x6RnptTUhhSmh2SThXREp1Y1l1R1IzTXNseWFIZlVF?=
 =?utf-8?B?andnZUhvWDZUWWlPOURDOEs2b3FKR0RVRDlMWmhjaERVTldyQnM0QUpCUExR?=
 =?utf-8?B?UjUxeWNBcWt2Rmp1cE9lenNseVh6QVpBQ0NFY2FUOWpidy9PUFVNNU5YQmJi?=
 =?utf-8?B?MmVnYVdGTHUvalJOc0Z1Vk1BaWZJMG84aFpsRWp6cUkrYW1zcVpQcGhrZ0VC?=
 =?utf-8?B?RDV0S2hHWDU2QmxUTWd6cy8rWlluM1ladlR4bWVCN2E2VFMrVnRFRFM4aTRL?=
 =?utf-8?B?bHdOeFRJMXM3Rjl1Qm5GN2FGK1hVTzJlUGxmaFNOVVlHZmRhV2RWaDlaQ3RO?=
 =?utf-8?B?cHdHbCs3Q0NFdzM1b3RRVFQzdWhYcWNIVndtNVdBODNNSWpmSWJwNisyT0dN?=
 =?utf-8?B?N0NWZ0tDU0dxUnpGemNtVWgycEd5V3pLWm5mVFF1OWdpa0RNYTFJVmwweFJo?=
 =?utf-8?B?OFdtWnhrZStSVWVCNGM5TDZKZUJKR1VKQ2lSWUdrNnUrbWgraktiKzlhZVhS?=
 =?utf-8?B?OGgyejcrRm9zUjBOME1ldk5MVDJRSU90Qm4vbjA4K1JyY0FRZGNibWxlaDhM?=
 =?utf-8?Q?dhdFbbB9ZQPG+/VP2h11SRVRVnG5CUBu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5e218c-1a57-47be-284d-08de9b5dab7c
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 02:12:56.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5435

Linux Upstream Status updated: Apr/16/2026 
@https://github.com/sophgo/linux/wiki

- CV18xx:
   - Duo-S support: upgraded to v5.

- SG2042:
   - Avoid L0s and L1 on PCIe Root Ports: upgraded to v3 and applied by 
pci, may be picked by next 7.1.
   - Fix SoC module in the module description string: Applied by 
pinctrl, may be picked in v7.1.
   - Fix CPU unit address: new patch v1
   - Reduce MSI count to 16: new patch v1

- SG2044:
   - Fix SoC module in the module description string: Applied by 
pinctrl, may be picked in v7.1.
   - Fix CPU unit address: new patch v1

Thanks,
Chen
