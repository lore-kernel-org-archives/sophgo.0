Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011032.outbound.protection.outlook.com [52.103.67.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2C126BF9
	for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 02:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739326365; cv=fail; b=mx69A7tJOmwBqM5shuchWC7SyMFPk58HB8BBJp0FBNJU8ZzaPvuzPu4719YFwkEODa8i9QV4E+z+fwVl/vDXlMFZwBNDP7RuUpeHANkjdmFvBDbN/C3xfj66RqrvtbYBGs4FyIphdYtoXY512XmjUpZcEPQwxo6w7pO/LwnJVe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739326365; c=relaxed/simple;
	bh=5A+bnhoqes5UkWQvwIL8FZPIpjgWDOlMTmghCi8pig8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=Vmq7JN0SzoCx5n1ru4HGPZQozA5e7E1VcuSD4DHiDq4X9//FDMS5+n+tChtT7sKx5XyrdZAqRpjrmswG01z1Ik0uShPtTP7guMZWzdgwebfu591WCmuPCBNMH4Irm3084y4SaLqalhFrd0LFcTjJ7YF+T11G6pBddRfyn8f47H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=j0v4A6PA; arc=fail smtp.client-ip=52.103.67.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="j0v4A6PA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymPR29AtXRmQRwUoZzxo/UzRxVziGmREUhENH77yp0PajAQEjYjtzdM3fuJU0PvVt+d4okef47h4rMgj0KqOM7CznWdO4Ip7htQgGLLb3kCeUv43X1uaroSsAL6+s+COs51zZiiaLR50CkEsoYbx65eyDJVg5+u1b7JfTdbGJc3/qMnYASMYHHuBFPVKeeusoUUaXgJp3Q90crlEmj6v+1E5QXX6NFH85iovRUFHAQG9kc/DAvL6N9vA3HZQHs+RfPG1o1Bay7fJ2oOtY2kBfh7eaYMMKE4rHY5vOWaQg3tS/ukFxSWImHwFaFkf7cp6l+6rFKjLog4OGiLdWSRHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A+bnhoqes5UkWQvwIL8FZPIpjgWDOlMTmghCi8pig8=;
 b=OrchsGPSoHuupFJajW+492vXfcOFx4MbPk0CsYAaDJ+O+i6kWDe4SAwZXvNp8MdlUKW8XZHJi4TFRpPJzON4WwlN+herYYJvAK457UhmJKWqZjXn+4+0+/KAnn95xNDBvGYIAG5OQN3msiEsNEQNKoNuaPO+ZA4pq8669Yrm7XSjq7wQwMlCtC/vrp82tMAuOMp4+h8KI73YVirzt79yKSkDKfJwjbwtkXRMsunN/vkP4SsiXp5W7IfOUJ+ZsRXt5pSz1tZvJ509bNaB1ATtuSG79Qwx+Inlrtck6hb01Q23nQypvQ53pPH/1qApv4tXj06iZqFlzW8R5i1FHJkyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A+bnhoqes5UkWQvwIL8FZPIpjgWDOlMTmghCi8pig8=;
 b=j0v4A6PAwmUrsWxxP7+ec2hCoXsELIfGKDOZ++AGR0OniOkCjjNwnzrYL6Yu4riLPtyyXgX85rBjAbeE+fandweEJ7mDVDE7k0CBrVhRLyETwCz+8jptJwbcaVe3mI1R0X7M9tAd0hzXzf5q1jTHPs42hcEwgyZctQnJiqC9Ge1tqHf07dfufDBXZJIYpjE1lwJK0fV2VwE4LpBbGtVEIKjI9tkco2fw7KUP3wrTqdCOVtauiINpXyjj6og7xFRHXUQeAaSOIDaw4kg+cJxRBBEUmkwqRu+u6KADOe4N9S2I//0eYPuHLyuA2FxFZV96W1vhS88IIx9VgAzNxIwuQA==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by PN2PR01MB4363.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 02:12:38 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 02:12:38 +0000
Message-ID:
 <BMXPR01MB244018527C713DC894D85E57FEFC2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 12 Feb 2025 10:12:37 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Test
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <e20f5349-cd07-49fd-9ae2-892657077790@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|PN2PR01MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1e7778-9024-4681-35bb-08dd4b0ab8e9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|6090799003|8060799006|7092599003|461199028|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHJNSkdHNGc3WGNPZXF2M0ZZeFBFMU1BcGI5anY1TXI1Uzd3b3JyQ2xsWmlM?=
 =?utf-8?B?MG9CSmcwNFJHa0NPQ2J4RlZmY2VkVk1kVEN4YUxORkxYcmFrLzE1OHRDZnJN?=
 =?utf-8?B?M2ZTOXVCMTU4SmNTeVNONTY3RXZzcWVXZUlNTiswblJMeWc5aTZjM1dURTVB?=
 =?utf-8?B?OWQ0L0pzSjJHUUNIa2plRHhBNEtUMFJHeWVOOUJ4SllubE91M2xiN3J1NGdJ?=
 =?utf-8?B?aFI1Smd4eVJRWGZRWDdxL2M2WGlHYWl5U00wejA3NnlZQUJvQkdiQ1ZwaGts?=
 =?utf-8?B?OCtCT0VVZkg5KytnVjBLL3MrVmtkSlNHMTlSTjE3ZDhuY0Q0K1VtODZxN3Zl?=
 =?utf-8?B?MlhsdFk2WXBtOFoxaGtZKzM2Q3NpRjk1a3lCOTNBd3YxL0NyeWlGeGlBTkJv?=
 =?utf-8?B?MUJSQXlVL2Q5L2JFMWxSY3ZMV3Z6TlVmVmlxUXEvSXRRbWNSNlhCR3Z2NGZR?=
 =?utf-8?B?UmM4aHVIR1ladjcyRncydFRSckRFTmQvcHh2WmszWm1Qb0tWeGk1d0dINE50?=
 =?utf-8?B?RVdEOHFnVDQxMjFpQldVZVh6K1NqQjEzTGZSZUtkNk1lK3BPbEwwbUVwMVdE?=
 =?utf-8?B?eWFoZmpQc2tmSDhxMkkrY3RRMzZsQjl5OGdGLzFDUWhpUVRLZ1l2aWtEd1R0?=
 =?utf-8?B?ZWxDank1aXVoUzFDNnpleE02TVAvTkN3T3NMWDUwa2ppRWczWENhMmdteDR3?=
 =?utf-8?B?dlduMjk5bkFPK2dRNGNhNE9jSnpyUTNFRHg0ZFpGODNQNlVDbm5ZRDdGZ2dj?=
 =?utf-8?B?SWJYRVV4RDVJVm9OTWFCUWx3VDVqTVdSTlZydG8zdW1adHJRQlc2UEVQa2xI?=
 =?utf-8?B?NlpMVUZJdlYxSHhKTStkUnJpMWVTY0RDUjI4Y2xyK3VEYUQ2UHY5Y3d2aDRG?=
 =?utf-8?B?OE9hdVkvcXI0V21lemNEOXBpOGRtb1NTSi9QNHZRbXRkMFNSaEZIMXo1UlVP?=
 =?utf-8?B?NmtITTVueWNoKzNKTkJJN3QyRmxxZUZDOUR2czRwVVNkTENnS0pBMnFIQXFB?=
 =?utf-8?B?djlHY0NkU3pMaTFwci9VL2xweGNzQ2JvU1ExVDViZ0puWUN5TXJvbVFkN1l1?=
 =?utf-8?B?ZmlwNmF2WEgzSnNTbjlDVDVTZzZoWERJcnZ6M2RNaUx4cjcvdkFtWEdkd2FQ?=
 =?utf-8?B?MjBGc00rZUlhSDlhbENCbjZkUWVVL0FORmVMSHhjdm1lY3duM0VCUWpVMG5t?=
 =?utf-8?B?YXdqR2o2ZVZqL3lreFdtMlBKNTV4MG8xWVNYYndhbzVCOGI3OHN0Q3ZnODll?=
 =?utf-8?B?dGtpRmxKcURtc1c0R2NpeEZlcjF1eWI5U0V2UDBLZTFleHFObjFDOWo3UGNy?=
 =?utf-8?B?NDRuK3VDZTV4aFN5NVlKVjBQOHozNjV4ZWkvaFY3VUl3T2R6ZlN1Vi9HYUto?=
 =?utf-8?B?WW5EZ1VEZGc3aEI3YUlTRzRMR0FDRk5LZjJzaUR0eksvTHhVOVRZWnFJdWJW?=
 =?utf-8?B?WU9qNjdBM21HMUQ5dUhjeWw0UjNrTmRFTVo4MS9QTHZzUkhHQUhxRGRacUN6?=
 =?utf-8?Q?YgObqc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmVYNyswVW5kcXRXWmhaSTU1eFMrQzJ5eVpiOUtDOUxQK1ZUYUgvUUo2ZE5y?=
 =?utf-8?B?Q2E2Zll5RHFEcyt2eDNkV2JkbjVQMzAxSDVldlN2bzVnQWdCL1BkS0RhMkc1?=
 =?utf-8?B?ejV0SENneURLRk5nL003eVFWV1hJS3BNSW0xc05aQmRWYW9nbjFnMVQyeklE?=
 =?utf-8?B?N2Q2eVlsQ3NCNHNqWTVvelZEQWZYMExuaDg3cng4MUpWaDZPOXV5aEVEaGZ2?=
 =?utf-8?B?bWZtM1p3MEVVRXg0cGtTaVRFb3F6ZTdoeldSUkQ5TEtjRERhYzZLUUZJbldX?=
 =?utf-8?B?ZFJwakp6YS9KeWM0dmRKSWorSk1lajQ1S2l4WnIvYm1ONDVrQmRLT09vbjlQ?=
 =?utf-8?B?c1E2YWx3dDRjZkZUWFJKZ3NYdVZvdTIxUnkrNXlEVmJWcUpIaVVIczFNQ1VU?=
 =?utf-8?B?UzBaSWhtMVdtempkM1FWMnFpeVdCaUdnZ3FnYnpacStmSWpmYlpDTnJWcm5s?=
 =?utf-8?B?eGQyVW9JQWVNa0JCc2ZDVTN2VXpTd1RRaHhGWGdHNmQxL3V6UWRkcXFUQ2pG?=
 =?utf-8?B?WHkrMVQ2bExDbm9kWktucGR0NmxnVmRucy96Rnh5RGRlak01Qm9PVU1aY0h6?=
 =?utf-8?B?aVIxUEl4dkI5SWVud1prcVF2RHEyQjY4bTJBODZqeHlEc2liWnEybmtyUGh2?=
 =?utf-8?B?Zm9Mdkt3alBzUmwxSjlleHl2QWxSaUtDeVE4eFNYZFlBc010N2ZtbC9XaW94?=
 =?utf-8?B?dXovNWJaTmJuWlFSa1lMd000VWd6TmxuMU55TzJPcVJBd2Z5NDB2WHpuU3c2?=
 =?utf-8?B?QlJSUmd1RXIwTTN3SFNvbk1NOXhQZDNZaklrc3dWRXd4U3NVWXg2TFdHNkJv?=
 =?utf-8?B?KzB3U3pMenc5ODJkd3pYL25yZ1pTSVRVSkliaHZLUVJLN21Ca2VRVHNlRThF?=
 =?utf-8?B?UU4rcjhJaFhwZmJuNUR3MXJnOFBRaWIzdHMzbGRmZmV2NFVlMjVjZkVQbWxE?=
 =?utf-8?B?eXZJZVArZk1oYWxEQmlyZXE5OHQzS2pid1JNbVdXRlJiUjU3Y0xyelNaTHp2?=
 =?utf-8?B?Y056eCs0d0JhM2toeVVyN3BpbWsrckM3ZHRjS0lud1BONzV6aEpLK3J5OFFz?=
 =?utf-8?B?dnZ4aUo1MHhIT05Xb3JFZ0w4OGZjazBxRFdNbjF6UVpCNHZaY2tZZmVuWlRI?=
 =?utf-8?B?NWNzdUJmMXFzRjdmZDhrY2V2WDRWYm1uR1ZpaFZMUzlLcm5KbmxJbExLOWRx?=
 =?utf-8?B?WmxvNThHVzE0L0VKKzVVdFNucGdsSkNGMmprdk14VzBiUCs4dGhLL3JENFAz?=
 =?utf-8?B?c09yWXVrcUF2UDNVdnA5WWYvSlpmSVpRWFRjQUdnL1BlOEhmTnZtVEhsSFBm?=
 =?utf-8?B?anVsZEYvenQ5eGhaUVVLb29pWXNQSkdrNEpMZTloTUlJdU8yVHRwU3g1bWlY?=
 =?utf-8?B?T0hLKzBrdFZmZHJPcXZZRTVFdG5JYmNJTWMxUndxRUQrb0dzb3dWYkZYVzFG?=
 =?utf-8?B?b01mZXFTbWhFRFUwR2REMFZxc043cUdwRXpzSW9PdUNPTFp5MWdhYjhjK291?=
 =?utf-8?B?K1VkWWNobVAzTURyU28zZEY1QUtKZHMzQWVzVGtEbFhSTWVrelE0Nm9nOE82?=
 =?utf-8?B?aUwzSEtSREJSWUhYOStKbFIzMTF5ZFFLNWVzNmtpTk1qaUNPcElMT0NJa0Ez?=
 =?utf-8?B?ZklWdFVEQndzZ3NhbVc1U1l2Y3dWWjV3UUVNcS9iT3piTmgwOUZ0VWdEZEZC?=
 =?utf-8?B?dnNIYW9NazBoaWhyR3Q2czIzMkpFYm8xaTQ0RjUrMkJCY1lsRExKMkVlOWZD?=
 =?utf-8?Q?O1bwP5wmeHCb2j65x5p4DV8wxhS2IUsIQ/uByt3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1e7778-9024-4681-35bb-08dd4b0ab8e9
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:12:38.2727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4363

Hello,

Regards,

Chen

