Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570AE15A85E
	for <sophgo@lists.linux.dev>; Wed,  9 Apr 2025 06:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180089; cv=fail; b=beo/4KcsDqk9+M0iARwoAz3L8eiMt0/aFb/z8hxzyphjhHT1JkEKz9HBOeRALcGFGkqhLaN4oZ9zTtHXSSM/nAKg8MiC+2m87rR/T/sV0d+tHchVbeSkC3itU8uca5jBeRfFVLMFz2G3AjLhNqMKYzOaLfTknE1PeOBHAbRnK+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180089; c=relaxed/simple;
	bh=1MO35iMd9Pg1QCi9yPErAXsad09R05UIFgPgGfiiO7A=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=iu/nRUa1AxAphO8Fnc0rt5qNbF/qdeIUjc/jhVoqNI3Gy0KLdeF7O9+Vg86+QdYf8DCzs6OnNQ5d33fH6gi51srZxzNFMOMCCRfajIdQseLrfFIblMXr4GG8ATswmZYc/T62NrT4dY3U9ewuOpc5GC2W558D3o7DQ6DdU1rDAIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eW0gE70u; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eW0gE70u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV6czEy+NQvKOq0ikckQJui8DC+NzFGIfTvu18Gd8X4R8175YATe8JphF4pFlerAyeckazq8E1xjJucTMWP4OP4QhZp5miVTArWmz0gCyBMXaVFMHHQiOnQM9AQVNzbDpba6FF5bcCgpf4/XFV70vxmJ+fe+tU75vrEjjcNtql4YnZS5A4iRCvS/xyeTpEhqnKyZrX76A95ZBIQO/MtybisOWcZmg652vjUA02iWQon2Ym+1QVYBfdw37Hufjjv/6A+pb1DMrZB4tmHGv3bovXiFENU1l07aFWGqAC24SWHOCqh/D9PDBKf4w1j6oL8RFfJii5VZoR89zLlQ4y6vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gouc5bnGpOEDBLfFMRX5mBhySpgbInIIzvSHQIvru7U=;
 b=NNcplxqus2Zqx27aF+BELukaC3iPRBlaP57OwyobVWRa9FjIKVtrZ8MYRuvj3ycZchFkjWJwvxhx9sJGaojxC6lM2EXRWummno0E4/KU2YjLDzUjDUmMz7vdsUcuqTVN9qBysybUT2F9AT9i8ggzVDzdjvbo44XKUZhmpZ1ZsQz8Rot4/QQpisDkrF83eptH28G49OXya7XL340xvYxNnzUEaSehUhOdqqOwkAfrfKTnzCp5e4S6W8Yzhg5EciqFrI1ZPupDlr8lWLyT1bvoGPccMw585AhDM4DqMqmwdBKWgW8O3wJQSm3kbPEhjRzRZTazM5D+u/d+6nRv2mMYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gouc5bnGpOEDBLfFMRX5mBhySpgbInIIzvSHQIvru7U=;
 b=eW0gE70ufdC3I/l5ZagJuEyv0sPu7SgDKN4hqjzc8W1Oo2uT2h3QeFCI7EtJ+qaCj4p5f2YnONZalSVqz43j07VtR7ejKiaAPChlYHTXhQ+XPTigJbvUzey1OhzWLm2zXijBWM6M2VRDXb/+i+tIAXN/rSjXO8MmHE2TP1QyniISTHDkhZ6Y5ISB1KWMnSFZlnt5gN68nihBL2wKbtAx9z8wyw8J2JhgDAFGb04mLWGVxYi86q/vFpMTelZxtNjNrszdINeNuku2yMxtoY0wkUt8wtGciXWrpRxIp6hSotqxJWE2oUzJ12YL3jONSS6BaqyZKbtX6EAPhgAh0TSI6A==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0925.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 06:28:02 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:28:02 +0000
Message-ID:
 <MA0P287MB2262DBC0EAFDCB0941C85C45FEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 14:27:59 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: https://github.com/sophgo/linux/wiki is updated Apr/09
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <b2c38d4a-cb65-4d07-a2c8-e99fb17e58b2@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0925:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2ed4d6-5b3c-4c43-35cc-08dd772fadd8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8060799006|461199028|5072599009|19110799003|15080799006|7092599003|10035399004|3412199025|4302099013|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW94elE4bGJ5TjRvVGJFN1BQQ3RmaExxVDdGTnd0Z05lenhuYjBwSUtPZjU0?=
 =?utf-8?B?K1kxcVA5c21YWWQ5MlIxak1GZDIvUVRRZGdTTTBhMWMzai9qQ0g1K29FaGs2?=
 =?utf-8?B?UFE3NHkyZmNPcjY4QThhai9BS21zUE5CemVwNTBwWFFacVRtR1NnU2QvMjRO?=
 =?utf-8?B?aGxXdGN2ZzBMZ3crOTFtWGtyMjN4SStxMlBBME1yajNJMUdjMVFvb21Oa01t?=
 =?utf-8?B?OHJQUjJtZG1rNE9lM1ZXaDdjRVpraCs0SDVjdnV4dENKbTVoZSs5cWNOMDN3?=
 =?utf-8?B?MDFjdTIzRHdTZHBtTVY3b3k5VFNtQ0l4SDdwRC9MVFZJVWtCS3pXcUVyRGRC?=
 =?utf-8?B?VGs5d0lFTldxYUgrb2VyVVBCcDRoanNEVWJnTmxtQnJWOWZzL0dmeU9xQnZD?=
 =?utf-8?B?dUppdWZpZnlaTEhxNXZOYmh1SlBqaGVzcEtIKzk4QlJ2REJMNlh5STBlZnU3?=
 =?utf-8?B?QzBjSm5mcUs5WkVFVURyZi8veHlZRjVQdkdQcytaRm14Umt6NUdSdWNOaHc4?=
 =?utf-8?B?MTJ6V1ozQnFPMXE2Sk9tZzJzQVpnRnBYemZYVnVWT2NRZFdNNExKVEcza0l5?=
 =?utf-8?B?K2NaaUgzTFZxZWszNndQT1lLTThwd2s2bEFkaWFUZzViNDFyY21XdzJFMk9u?=
 =?utf-8?B?Q041aitZa2RMNkZVeXJsV3ZNN0xIOG5LaENiUk1BU0NQb2NWVG9OTnhSSkhG?=
 =?utf-8?B?dms1dXBkM3JWSm1qTnFGVWxaSWgyTXhMcDN5bmg0T2RZZVdnNWRlWGpzVW9J?=
 =?utf-8?B?dHpkRnFYbGdDRW55QWtTQllxSzBqMUpRSHljdjQ1dFZPSFROdVZRY1Zxc1J5?=
 =?utf-8?B?VWtlM2VsdTRmS3A4ckVOSXVNMk1zdXJDcVpBeDdMdmpmb1N3K3l2cERjdUZi?=
 =?utf-8?B?Z3FKTTBXQ1BzZXJBVURNRHpCRlFTVmlZSC9ydzFoWUlTLzNyUmk0K0hzcFFJ?=
 =?utf-8?B?QkYybjBybkhmS2NPWXVnSldTZm9VQnNFaFVCZmFjSDZBU3Y2VVk5eDllSUpI?=
 =?utf-8?B?YmZWcDlyWjVmTXFleXZxR2FhZ1hNcDlkN3h4dGRZTEI5TWFWRExSK1NyT0ZT?=
 =?utf-8?B?eDFxcVNYa0ZLMFk2eWhBK1dYS3M2TGNCbHNOTFRvMWE1M05TZTBtRU9vdjE4?=
 =?utf-8?B?MUprQmZvK3VyUE5IejhGL1M1NStZVWZBMTgwUDFsMC81YThtOWY2VVpaSXh5?=
 =?utf-8?B?R0lmMFBtSkVnM2hYY1BaVGpXQ3IzK0NXL2xVNktTc28vdGJNY0Z4cUkyQ0Fv?=
 =?utf-8?B?M3FSek1yVXMrb1RqeEM0aWpmN0xGb0NhV24zdHB2bFlLbWRoUld4TWtVMitr?=
 =?utf-8?B?bEI2RDdrQ21Bd3ZScVgxem5XdS9hS24xTHloeHVXeDFrSjNNL1Z5QmxlcWZi?=
 =?utf-8?B?NVNlRjZhTHo1aXZPSGwzTndqTVd1RzJLWG5UenA1TjB3djVCV0hPQnlITGZZ?=
 =?utf-8?B?dzd1SUxvaXpFMklNdk1zSjk3eENyMTkrTHF3OXMyS1dYZlhLbWZKMktyWlgv?=
 =?utf-8?B?V2Qyd3JpV1l6RW1yam90Nk5Pb3N4MDZlb2xFTmlVeWE1M3ZMK0Y2cy9hdHlY?=
 =?utf-8?B?NktRdSswWkllczZuYVBRNmxxOHdHZmEweS90cFUrQkUrcGNoRWd4NWhWM0Nr?=
 =?utf-8?B?bStjT25ZQUtPZXZuS2xCMGlKOFRJY2xNa1BzTGhWZllVZUdocktIN0JaOGJl?=
 =?utf-8?Q?5TM9tSR/W19im9AjtjlN?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTRoek5QS0dLRk96M1Y5TnBwU1h0M2pYR1kwbGdjQ041OGNib2diVkhNNjBC?=
 =?utf-8?B?ZGE5M0pRUWl3T2RrOFdibjcrS0YwSjRNcGxiNjArOExZY3hwTGdOVjZIeC9H?=
 =?utf-8?B?ZjA2SzAveDVIMjNCdjVieCsyYno1bHN2QTgvOGQrOXJ2dmRIekkrQ0JjRVh2?=
 =?utf-8?B?aGhnUXlGWWtWKy83T3lVM2g1SU80cnNzQ1A4NkkxRC9vQ0d5K1A4aXZnNmVL?=
 =?utf-8?B?d2JOSk1XTDdnYU1yZlRkY3g4M0k2Wm9RdXVoekZxeUNjcTNqdkR4NG95NEls?=
 =?utf-8?B?RXVMT0dDaFJYMDJueUtCZUp3VHlUWEt0MStEcms1UnFibnlZdU40YmtmblhQ?=
 =?utf-8?B?WlpwY3VXcW5vZDVOdiswVDlkRk1yYlZHOVZRbVlJejRTak1jWXpZN204MDk3?=
 =?utf-8?B?RnI1ZEptZFFMaVhBUEYwU1I0bDlZRzB1ZktvL0RsSmxIMm9vbGtuay9hLzJB?=
 =?utf-8?B?bnJ4dGZ3TjFCWDltTjY0RExVanIzb1VxMzBGWXR6ZENDUlhLWXpjbk1aY1Y3?=
 =?utf-8?B?aEppM1hNRkZoYytFRFl0dW1ZZXpKam4rUjZRRVZMRThTVE1lcmcxVWhIbFhP?=
 =?utf-8?B?a3RZOVRuVDRkbEkzVHF3K0hQdDlCZk1LTHBScm9xcUE1d2JmZlNIYm9zdkY0?=
 =?utf-8?B?VEdGbExSYXAvOG11U1hkN3ZkTUdGMDEyeENQSVNvdGFKcGFzWXR1Rm94WGlC?=
 =?utf-8?B?eWEybjVTL3k5NkY2UFdreGh4SUZWVkJTa3pHT1pHeWs0U1VVeFJlNjRNeXZi?=
 =?utf-8?B?aXZsazREdVpzTHJST3ZtSjJNLzZKZDdPZHA1dzNRQkJPY1lXallONW80TWVH?=
 =?utf-8?B?UW1xVS9IUkhrcHVrK090R0NnYTdNSlNHb2lIZUV3Rm15dWVhQnZhSndyN08w?=
 =?utf-8?B?ZE9rVHQwTmJEMXpNcVdodkk2UG0zV210SklROERCRWlmcWRoQTVYeVFtTkV5?=
 =?utf-8?B?Wmsyejk5U1Bka1c1b0FrdVJSYmM4QVZ4dlVDK1Iyem0wODl6cHhZVDhjOHY0?=
 =?utf-8?B?OWNpZ3htdFZDekw2M1lnR0lhaUlXS3BFdUlYaExKQkpHcHZGalhOSlZTUXg4?=
 =?utf-8?B?S0c0bDlYNjY0NXQ4WExVWFI3RXlpNHpaRk1nd2l1cy9pVlNndzZoMU5ScGQ3?=
 =?utf-8?B?YUxIWm9hVVoybDhzdlBSMnVmc3VQeFFFQnhXbVNTVisxZTdpeGtXd3JIMFpU?=
 =?utf-8?B?cTF3dGVLUHd0U1d0WkFnZTBSMHpxdDQvcUUyV0pwN3p0NVE4MUJIZWpxY1lT?=
 =?utf-8?B?WFU0L1FvL3VxYmdLa3JkdGVrd25naEtONFlRa1lnZ0Y1UG4vT0N1cmgwaXU3?=
 =?utf-8?B?b2lkYlova1pMTEN2ZmEzckEvamkyMWZsV2U5OHVPNWc2Q09YZjhqQjFNRTg5?=
 =?utf-8?B?Ti8yc0VkMS9tcy9LWktRUUFhRnl1cnZ5NFN0cTlWNHNIQzB3Y1R6TlRqWDNL?=
 =?utf-8?B?R2pDVUVLOWVJMlRzWFJjNlJ2WnhZeUxIbWhKOHJ1aEV5SWhMdEYvVGpwVzhq?=
 =?utf-8?B?NWhWN3NUVHg2VkdhaERQZnVxMzlpSG4yQkVHVkd0bnpIUi9tcnJBTXl3UEFO?=
 =?utf-8?B?cjFiU1JRaDU4NW9WSGtoZU1iM1laei90Q3UrZmZ4YXlvZmsrTTdqRGpmWnkz?=
 =?utf-8?B?NktJUitHVW5yZFA1ZStlNlBHNDFCSTJWNW9wNU1ha0VSQVcwaUZ1NmhLV1hv?=
 =?utf-8?B?R0dOdm9TSXdKdnJxV0tMeEZja2QzTURvcXl5MnlmZ0hNRmNRNXR4ajlOOHNu?=
 =?utf-8?Q?s0hZg4/J9tXHJuOhqqi5YuoFJOqVj5whO8hl3q+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2ed4d6-5b3c-4c43-35cc-08dd772fadd8
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:28:02.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0925

Diff: 
https://github.com/sophgo/linux/wiki/Home/_compare/616ad7a79bf6f9af63e28d2898d543ec38717d93...f8d04cb180f344c6a4e6d30259f7a11e814855a4

Thanks,

Chen


