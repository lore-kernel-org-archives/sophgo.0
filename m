Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C43C200B0
	for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739330276; cv=fail; b=rRcGqCAKQwxAjyvjkVF3voVX2fTXMSbNd/lxXbvt0t+A/tWOF2f/9ckAM1N9VijdEf5kBWdFKWECuw+AvMta/ACzTQzqN3Mrgo4JuUCh48vBPNoz/K7GHF1OaUNEr6whvgYnupyDMm/F9rPtIkaCnPKfquir696mGrBzpeNbChw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739330276; c=relaxed/simple;
	bh=HjdZwJK8y0ZKr4RWfFBg5meo+S0ZsPUARXAsLUf8EM8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=lFDOjNVOpLzGeXB34hFJaaoyvFg1znerBlO84w0XpxkERd3mLDJvmHrbvP5lxSJqw/oPYOB3cgKHEKe0rU68IdUkIQRfoUolLWpXiKqqMJ7xiY9qegk0ZRMQNLYLwGwBoLFa5M4sVIB0SMgDPE9jWLV61WIB6VNL0X5GUomUta4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=B/GAsWup; arc=fail smtp.client-ip=52.103.67.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="B/GAsWup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvmYT4lDWHsf6H/C+STY5wKDahMTMavjrKDvsFJBcF00xLwYjxqTIXKrCnYO6I9NBJjO6fmY5ZSqZ3YaI0oz9A2qY41BZ4agwELvCQT3qHq2zQjbxpgRVuUJIzcLdfHvjFn+yYn4jJqJJRMxPZywp/mlasMkCTslwI4cT07Gy1RckRR9r8eOrb4+W6m0QUzfqsAsZ69UuIjcFxXIUWV+5TvK3TsRLd6kPfJD6br0G7ZSA1/0+nw0W+Te6pekDKCQEQ5E8XMdkg7/JSesAo+mihftLOYJ/adjEX1kBFw6ZVkgl0KkWPlPY4xFAZZqN6UhFUzA1iSCVos4UmRhLBk7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjdZwJK8y0ZKr4RWfFBg5meo+S0ZsPUARXAsLUf8EM8=;
 b=skMDnm97mzTb5radDMQ6gZqw+kAhQu2FBR+DVAAyFtght/HAg/mY67ZoNVyqU/smVj26VYhLDzi13SeXOhya54sJ5umVBc0NtSPXTeFic1v0v/wx947ha1djUp8P17rJYpAKelHrhaIsg6cvJI0TmW5aORAqY/tvENVI4n/Tuz0mQmGRVbwATmafSZL8y1W7pq2s2zUWGskwn61Rp8hcD0H+UDACVsdBS7KaFfb2di0ZBGbL0INxUEUy+ovm6LAzj9TyfoUoAiHxiCjEeQjx5Khr3nM8BZL5QKsKQvDugKiCiFd+PI4xenTg+DkBoo6MlwxQ+MyoRZalUxi0Eekorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjdZwJK8y0ZKr4RWfFBg5meo+S0ZsPUARXAsLUf8EM8=;
 b=B/GAsWupydgW1FKtKOz3VDqv4CAyiN6D3P3K/3sWGCcaUHaRMWZH5b+iRtXMi/OPr/DRfMF/ckNVsgzKLOxZyR8wDfqkqIjMqlK98xxCSvIL9B2ewrKdG3O56J3U/a+HKCZcD7i75tM2torBoN2QvvxaOsnIqnNzzRbRrb8M5+VCKT16wW7lKq8DKXuNurgAV7B8muE0Btkz7KMgDl+WpW3On/Tqnnz6vZ6PH36hcgsr2p0KNXPD92hYjSvVmWOtnOq/J9Ek/hoV2KIsS4WVWHCHxM/1vG3dnG1XE5QNYVO3AN4yZRGKmFig0t8UGD8hRXhEluM8e2BsgnG5xUxv+Q==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by MA0PR01MB10267.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 03:17:50 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 03:17:50 +0000
Message-ID:
 <BMXPR01MB2440C4D8CC1AFB7DA0DB2A8BFEFC2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 12 Feb 2025 11:17:49 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Test if I am added to this maillist
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0217.apcprd06.prod.outlook.com
 (2603:1096:4:68::25) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <3cf993eb-dd1c-42f3-83f0-a18b50d237a1@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|MA0PR01MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: 227aa0bd-f7bd-4d6a-c977-08dd4b13d4d4
X-MS-Exchange-SLBlob-MailProps:
	UDhyqGRoB4b889fVhRJ2YOt0YVQIRbgUPyzvmPjOrX5aHOBOh8cCN8L8ioOq76TanNrlykaR72/QjK56+v8Kvnv+nycP//SEmhE10vswpOo6xw8RmczbGWoJJPkGT//+vio9bwZp1SOorrelknyCaTwwOuiKEECACoPXJxK8ZVapSfwaRP1OtV+Chm71kcRGukPjXRadyelkRgSx1kcqkzEtpA3/QG3RkwXmfJyxjLK2IMbQC+cUYDSiHGBQQ4SPbXeuDpdDrfirXudd5ZoJnoDpzG+aOlqPeSYy9Bpg+yuyaeUcnnaHBA8qLUWRuBYS6gELNIW4UKqHQFKz7klOLJU7PULODeFOUYejf4MDSP10lGG14MLvQzJ5Ov6CQB/BYwbBzIsx2vLlaguJ4oXioLA0jZotregCeMdH0U/Mdblur6XbwLG5IAi7m3BTM1fqihymSbHNlBcbaJuD9D4RDfj9sawUDZ/lYHcHQ6jSKyZyN6q0t08f8GROeStg48n0Yn3AZT0SoZDaEbrksJQf80PQZS9uvUyOyB+3hkGBzE29UQ3THxPwjqwx+Urjn5dMPh+3P5l7S/qFMrBy+nybDs1M//s87UhwRpRdQfbL4iWMa5APF14zwo7ETvpJo9KkqrbLEO4UCYCS0DYUYvMgrpq563urXseFIhODZL28t9fyZhd0tmErpw==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|15080799006|7092599003|6090799003|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDV4YUpCMm5pS2IxZGhZWjJZMy84eEYwQ3l5M0gwN1hxSkVuMHpzRWljTURr?=
 =?utf-8?B?SG01VmVndlVZQjB5Mmc3VkdzelQrK3RPeVY2Vjh1aDFtNHFoUEt5YWI1WnNU?=
 =?utf-8?B?cjNiTXcvWTJEOXlLQUlhbDh0TllHTldhRDN6TGo4TFBkUEN4c1hzK0xQV3JU?=
 =?utf-8?B?MzFJd2s3NDgrNm1kbG15Tk9LRHp3bGp0dWRrZzBWTi9hWHlGZzQvdm9wOVgr?=
 =?utf-8?B?bWk4SnI2amxmZEM5Zjd6STdvTFBqU3dVa2UwdjBvbGFwUVk0QmtjQit0NjBJ?=
 =?utf-8?B?S2JlQ2NmaGN1MHVaS2ZRZFBxWlJJQlhldWJUZU1NRTZPQkI5Q3ZmRzdBNUJN?=
 =?utf-8?B?Tmc5WUQxU3dUMkYvOHE2NTFCOFd6ZFNpLzhUbmJjL2l2YzUyY1FQeHZodTc5?=
 =?utf-8?B?RlBKWkN0aXNYU0k2b25SaEt3ZUdOeThNWlVBTkIxZml2VmNZSXhoeGJUQ2Zq?=
 =?utf-8?B?UEFzUytBTFZxMlBQYWpHeVBIV1BFYVRIN1pDRi9KZlZvUUh0b1ZwQjY5K1NJ?=
 =?utf-8?B?SzA1SzRMS0UwQkpnN1BYWWFTS2t3UzZYNE95b1FVS002bDdjMDBoRENQeWIr?=
 =?utf-8?B?SVBNRzRLMjZkS1VpUC9iWlZaR1B2SE1tM3QwL21maXdBQUQ0bXVkQTE0SHBP?=
 =?utf-8?B?WGtmb3k3eXRyWGFkUUlCTGpXWERvYnJWQ2NWY2dkc0pTZ1VhUUp0RWxlaFFa?=
 =?utf-8?B?MnV0djkvVG1IWGV1OWpoWEhlV2JhZFE0UDJoS1hKWnVGTGY5UGYwcGVjVE9G?=
 =?utf-8?B?aTVtZGRXdlFFdFQvU3p5UXFrRk01RFdTb082Wll0dHllZTZKVVVabFp6MlVq?=
 =?utf-8?B?QW9vRFlsWW1Wak5VSWRPUFREQVNHU1FkNnZGMzluZnJyOXZ2UDFiYWRPRnNR?=
 =?utf-8?B?dVZRQlVMT2pxcXFESmJkYmNGZVF4aFJ5Z1ZiOHZ2a3hHZ09Ec3dNdk1DK2xh?=
 =?utf-8?B?blRIaWZxU3ovenlCd2xhTUFVQk5hZ2xkTWduaFh5d0dMOWhJYzFjMXpmcUwr?=
 =?utf-8?B?V1Q5THN5dW4vVWxLZHlNOFYvNlB6Nk9kRnRVVHJsNE42QW5RdUZpZmVBcVJT?=
 =?utf-8?B?cGU1K1RvZTNZaWlrbGRnOUhLMUd2dHpYck9kaGJ4cWVldndQQkdtc3NFb3N6?=
 =?utf-8?B?a0FMQWJOaUZTbm9aNHBzTEhhNlQ0bXBOODJLbExObjRRZE55WW03ejZvd21M?=
 =?utf-8?B?dmsrN3NURE8wUG1XdW9SUjBSMGpjSzdNcytUVXVkeHQraDJNNmFldEhyYkdt?=
 =?utf-8?B?djBXMWh2RStTNXpQRHh5SDM4eVZCQytwU09qeU1yLzRuanVYQ2FrNHlIRm5J?=
 =?utf-8?B?RkkvUGFlem5HS1FxK2pZOUYwN2ROQzdLL0FLMjZZbjIrNzBkTlNLUGJKbXd1?=
 =?utf-8?B?QWxHS28veWNiZFBlOS9HbDdqNERQb2lzaFd0VG5WNGFKS0VodGFRcVJUVGdy?=
 =?utf-8?B?MDhmekJSdE53UG5TcGs0SnAzUWZOSjgyZlZmS2dSVnRkdnFLYldqVk8wYUtE?=
 =?utf-8?Q?BXGURQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdnTUdFMGtZd1IzYy9oRWJzdEkydE9KMUx0UzdFTmhhQVZzcUo1S2VhaXJn?=
 =?utf-8?B?N1Y1blgxeGdkZDd1QUZXelBEZTJtdXBlMGJGRE9YS3h4L3VXa0h2UmJ2THFL?=
 =?utf-8?B?TUhzZlJRUDI2TEVBMVk3RzA4dThQM2FKck9PR2g4VXhwS0EvMDMzVjF1QnI3?=
 =?utf-8?B?NE1ZbXdNSVZTNWlYbUdrQk0zNmJxVlVSVlE2T3RvcFM3WndrL3hKVW4xRWJ5?=
 =?utf-8?B?bThmSllHRTlPRGRHSDBJalNEVEpsaVJobWZIVFI3NHBwWG9qcTNGaFM2aTFw?=
 =?utf-8?B?WkM3UGM1VnJUK2tZdW9rRERRQ1hmVUZoZWFsR2MvSXQxREVXTkRrVndWUEto?=
 =?utf-8?B?SW92S21Kd2VsWUVBVlZ3cUlpeldCNlk2bjhxSit3cGZRRUl1TmE4UEhpMDFV?=
 =?utf-8?B?M3ExdVRGRHZwamFMNXVEVkIrM3BHS1FSeUs4VkVCV2hDMXhSWEViMVB2ay9w?=
 =?utf-8?B?YU5pNGV0MzdSc2hicE1QeE10WmNyZGJDL3dZc0JydWIxa2Qya29iSUZPSmJE?=
 =?utf-8?B?TVhvU04rOHZ1MFlDYi9YS1ROdG8xQTAwSVd3bzZHeGdUeGtJSkk3WVZGWkVw?=
 =?utf-8?B?U1Y0WndmOVNXZi9hUEprdCtSU01sYi9zUUdvTlpJNFQybDJsMExkdnk1MUZM?=
 =?utf-8?B?eitRQVovTTBza1FtK3JNdStGR2pXcVRNZldIdjNKekRiMmNWemxjbEdBYmVP?=
 =?utf-8?B?QjJqTEs5c2gyN3BQanZqTk4rcHJjOVVzdmVJVTZLMWEzYzVkcUtiQ0xZbjBC?=
 =?utf-8?B?bEdnM2lCOXBTemRFdnIxaldjNTBXN0tFVUhnOTJqdUJBYi81c21mSS9VeC9h?=
 =?utf-8?B?a0NnbXNveGZuWkJxaTd0NUNJSnRncSs0VkhZMFpTSTJtL0RYZklzNkdBZWNO?=
 =?utf-8?B?TU4zS1U1Tm5lV3FNZ0p6OFFGeEJVM0lzR0pRR2ErN2hVZ3hNcVhKR24rOHZZ?=
 =?utf-8?B?SkhiV3NjVHdjWnVuSUV0K0JNZ3hacjgyaTBrODRVRVdWSzJaZFR1V0NaeGQx?=
 =?utf-8?B?OVRPTjhtU0oyQ2pnM3drdUJQc2d6MlV0U1RYdTlnWDZIWXc1VnZwQkNFdHlr?=
 =?utf-8?B?MnFCdDJRM2pFZzl2MDh1N0NGdkQzTnNsV00ybTAxbkVOWlhUTnA5TU1DTXhO?=
 =?utf-8?B?ZkxzL2dvWTNLSzh3d3RpVTJEaFIvK0wxSXE2dHhVdzJXNnJCWjNndFFqMWlE?=
 =?utf-8?B?MGVodWN5R3dWRTdZSkJabWFJcFdBRStpN3M2dG1jSUhZN3JIcXRrQ25kVEpx?=
 =?utf-8?B?MkZuWlVRTDJuMWFCQ2VxYWloRUJCTnUrdzVEbnhwTEswNVJUWFd6TGt1RXpw?=
 =?utf-8?B?dlM5OXpydHVVaCtwczZ1VjdSUUZiN0p2S3U2TTVnaU9palBiRTkwY0owZ3JW?=
 =?utf-8?B?OUc3QnJQbGtRNFVvT2dNWGJPTkcweGZvL2s3aTgyV3hNR0h6ckIxVGxvaVFW?=
 =?utf-8?B?dnFiaHFzZjh4dmhaOVBYekJ3bE91eDhTeTh6WW5qaWk1OGZlN29CdFlZcUNm?=
 =?utf-8?B?djNSZ21oeHdIaVZQbG5tWUNkUHZyOGhaUWczYVo0WWRtMEtVMTNxNEZSSm9m?=
 =?utf-8?B?MVdyT2dteC8xZ0ZTQjY4Vm8rSkNST09DOXo4MCtHRXU5MFJldlB6ZzRFV0RQ?=
 =?utf-8?B?VGZxb042TGVwejRWUmJPZWdRUWxGVWRRY3lZUEFYcW4xREZ5a3JDTDU2MVBy?=
 =?utf-8?B?cmxIOGgzK3NWWTJUTW8ydktvVXBWUVg1TXJhUTg2Qk40ZWhaQWN0dkk0VjIv?=
 =?utf-8?Q?GZmUmsHCrmgTQOW+3j1RL3c+2oyenWCMTy8xSkK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227aa0bd-f7bd-4d6a-c977-08dd4b13d4d4
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 03:17:50.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10267

Hello ~~~

Regards,

Chen

