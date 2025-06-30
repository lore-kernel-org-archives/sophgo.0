Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010010.outbound.protection.outlook.com [52.103.67.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D377628F1
	for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252826; cv=fail; b=FuHFE+2JrRw+KnBA3tTAWUk6jqIgyvF6VeopLWXyoqQm9wmWJkpm8mQb+9bI59KQtP5gitE2aZQBSF+PUsvgH7UV1oO/0izB59f4lyAdCc61/gvcv3yixfdhA58zaJmELTSX5rUA7iX2zReKyDM9bSfs8OqPGT2RMvUUpWqPzCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252826; c=relaxed/simple;
	bh=jDb6f35byA06Pc7lUcWU/zsXnOpyku6YEb93cQkTRtE=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=UsgSFMTYYse+mqU0xOK8sVxHEGh5R67vuXHq0XGYXEQ6QJvRxRuJOjBfJHztrw5npPoWGbj9omCAe1fGCsaI0exQD3hFy8wC5ePJlpTG4hXvuLrxI1Vza81Cm0+XOJP3hjudAAEZtHnVyzZ2EZ1EIzgom4G0tr/VfvAzsVHDWCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=SAsQ6yVl; arc=fail smtp.client-ip=52.103.67.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SAsQ6yVl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY7A7QNzR665qKh9FgYeSl+5YDhrzsC9HwWgw/qWmJWPyOkGxuHUJpqKJTj64r8HwCKRoWaYPOR9bKjGGg9Vf/8H2VbIR+OjtU7hI3Pag4Uxv8Jj1i+F71GUMFgb7UyNhFKjNmSChWpTO9F997URfZ+lGzqqeZ0H2E3VVlQAAdrVqq5IOItIM8VnwcG8Yvcnuo9QA8WGa1PxY1wXbpt0iMRk2fTJggUym/zXC81Twvjb3IYXxMexXU52Mik934e9E5FfqvbH1gB4GkDpdX/s4QEsVvk5L666OYfwPXtGMos2rM1a7B4zd11dMh+m7JMoo5+9zbm3KjNpEL2aQPndSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV8wfpUTilpnU1Cmc1JP5EedNwaJehv+yP26TbqQM0s=;
 b=Wmc/HVA8Sho8XuFAvq6c4+oVPuHaSdhOz6WIfM+x5dZoJ7iR4IfwRilxs487K6CK0pyvlkmGrYcjcS4XYci4XLbX6SsgteqzjBjMWSDhVTuenPdcfGDS9clOvq59TFWM2UIG78bZrejJSQSiJF80yFljQd6Da1gZr7wisRpyOYipLMEz8FwZssPQRJ6jmQ0BLTMaUykUGO/9l038iWGYCEBDRARlL7d/FOK09l9JEnyWgYNzgLWVyiCa9LJbxYcn7WvIHElA2co8w7LmTMVxc+172oCMEsiIym4EB6x9EXbFtWxe+LY77KSvMVqZbLEMdGAq0oqWJDgQu4S21T3JcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV8wfpUTilpnU1Cmc1JP5EedNwaJehv+yP26TbqQM0s=;
 b=SAsQ6yVl/oocYogKDLV3ABIuyT33TuEBGSt4qMSjkMPPuTGvhJDfNk5CMUb9WS3CySgrsdMLkU/2whFg2yMTs7ccSS49cJzgPOTkDg+xVxkLFenSFpsL32YVDh6uEt+z8Jr/SlavkqEexghWP4ZREqLQS8CPMrZsPMkTBH4C4wOAisMlYadH6Jgbx3XVtQ+rrZTbAwMe2Rg77BNPbvfW2C7TasJcwEf2YY1zuyCdciiYMEZcRJ57agfbpBs3AfrjKPX7tN6vv5KO0zZxUZfMoe01wh1l0R5EA2oSBG9+MGrN8agqbBoEwjxoFw3gAoMuzl2UznrgHMtovWfgm4yoAg==
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
 by PN2PR01MB10372.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Mon, 30 Jun
 2025 03:07:01 +0000
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c]) by PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c%7]) with mapi id 15.20.8835.018; Mon, 30 Jun 2025
 03:07:01 +0000
Message-ID:
 <PNYPR01MB1117121C7DB0E28BE1D7BE14CFE46A@PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 30 Jun 2025 11:06:58 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/30/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
X-Microsoft-Original-Message-ID:
 <358a0d79-e086-4b5b-965d-70830e2e20d9@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PNYPR01MB11171:EE_|PN2PR01MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4ddc3a-177e-423e-fc60-08ddb7832e9d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|15080799009|19110799006|8060799009|5072599009|22402599018|461199028|6090799003|13041999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVNlcGp2aExhUlh6bkQ0SStnS1RJaU9wYk0rMG9CVGpaTktVVUxBbkd4ZExp?=
 =?utf-8?B?Vkt1aWxDK09sWFBHcFJuODNYanR3VHhsWFU4RnJrUEVMc1NNeWlEVGlKSVF6?=
 =?utf-8?B?S2cwVFRmL1NQblJiNjlrcWlrMlBISS9oTFNlWE1RL3YrUURLbldweUM0Mm9o?=
 =?utf-8?B?QVR4V0crdXVNQ2M0dTlrQW9CeFlKSnpmVEdFMmozWUZYR1F4WjhDb0RFektv?=
 =?utf-8?B?RGMxYU5CZEtJZHh3L0lVZ1NWZWREYmpwYzVNNDF6UDErWlJZOU4vS2lFQm1F?=
 =?utf-8?B?TDNpUTdBd1VwSnBvOXh3cXZNcXZWNWt6OW1hcVFhRGtLcmk3T2x5blpoeGpO?=
 =?utf-8?B?WHRTd0w5ZXlQYXJ6by8rQlRZVHNVRFlsclVEOEgvWU1nVzI1WXlkOVY0OUN6?=
 =?utf-8?B?dEFwR2xuaWxKZ3I0dDVOKzR6ZlUzaU93NFQ2MmF4bCtKLzZvRVVUcTU5NGJY?=
 =?utf-8?B?clRzWVdUUklxQmpySTlrSzdNZGlhMDJxcTByd3M1YXVlQ3JnT1BmZFF2a2s2?=
 =?utf-8?B?U1ltbUlXQ281OHlnMlJsenhSb3VIZGRZUktzV0p2U29PY09qL0JHSzljWVBa?=
 =?utf-8?B?aTFrVm54T2dra3BZdHdBYWtUNStzYWRiV2NkZU1zOURGL1pXbW1YTjB4bWQ0?=
 =?utf-8?B?ZHBuckV5cE4yN3pGbzJCcGNUeXJGSGxIV2h0Nm0ySWlkbGkvbjgvZGkzdHlM?=
 =?utf-8?B?bHlYcUhSendoRG9najkweWgxY1ZUcmFtYkduVnJKeDlwc3Z4UXJyU3NXeUlY?=
 =?utf-8?B?YVdrd0tFWitHNnpHeVNNdEhSb0YxaEpOdXpoSk82ams4THpsWTlVUlllV3h6?=
 =?utf-8?B?RXduQnF2MlZzcW0zMm9vQzNneGc0aGFYZ1cwbFVNOWFGWGFwdnRscHVIcGcz?=
 =?utf-8?B?QWhVNWlaQ2k5TllwZXVBUnorUmx6Wml5dWYvQ0gzNWRXTjcvMEtSVk5ocVlr?=
 =?utf-8?B?Z0NMcmtRSjNnNVdGazRWUDY4QTk2N1NQbzlGdXBNNmFvbk1PL001aFdRTXFJ?=
 =?utf-8?B?c0ZNS1B5c2E2US91bERCQ2JpTG93NEVBeGRiQWZSRkdNK0VjUWdxam1RTnZU?=
 =?utf-8?B?RlZTTWs5QStPSkEzUFd0ZytZN1RIdnEwdzdXanA5N2s2dWNBVy9Lem01WnJN?=
 =?utf-8?B?YTU2YjdNWXNKRlBQVUg2VWF0OHFYdHViMDJKS2k0aXJ6MjRxVzZFYlkyQ1hF?=
 =?utf-8?B?NEw2cW1pbXRFWTUrb1Rnb0ZxbDFHUlJqRWVvdXZ4dTFtZEFuOUcvMXlTM0sw?=
 =?utf-8?B?alZneUczUjJXKzZQUTV1ZVhrc2U4VEp6a3pMZEdCQk8ybHZVcTNCanBzM09q?=
 =?utf-8?B?Smx6bTBWa2tQUWIzMEVWTUE5bFJaTDdaZkJQYzBVMTFkUGtUdmx0WTRsZFEv?=
 =?utf-8?B?QnJzaGoremlzYm9WZW9CMU5BVzAxaWNYSHNjODg4R1N5Z09EVWdPbTdjSEtD?=
 =?utf-8?B?MW5mYXlsSXgwbmhtbkUwUXg1MURXcWY5SXI4QmdRZUx1eU0yZ0RHMUJFbWEz?=
 =?utf-8?B?UVJHZXk5cWF4czRqckkyUDN6TWNBNnpsNGcvRFBSSWNCc3Z5ZHpDRFNIMUlN?=
 =?utf-8?B?YmdXRDVUSjZqRG9ZcGVXdEFuZjJuVG56aUgvMndjdHZYYVFoK1p6azBMY3ov?=
 =?utf-8?B?bFlUbDRDSDhXbHhTdm5XWHo3WHdKUXc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1NRZng1czdGa250M0FyODh3dWZFdWNqZzE1VzM1dExYLzJvRlVBcjdMUUd3?=
 =?utf-8?B?eGVrYVNYRW14bkZYNE5NL3lWWU03ZjNrMGxDSnk3WWFqZml0T0N4K1I4NkFZ?=
 =?utf-8?B?a08wNGVNcC9WaDJDZDV1Q2ZRRGxxV2NRRjJ5ZUhWMDQwVzVRUXhSaUVTbUli?=
 =?utf-8?B?bWlydEZxcStxTU9ZOHY2ZmZFMCtLUG53YkcydXUyU0lYV3Uxcm12WUFBSUg0?=
 =?utf-8?B?dW94TEp3U0dycjBhcXJ3WmxsWWZ2L2s2WWo0TWphWk9LR1p3RWFmSEFRTzAz?=
 =?utf-8?B?YUlFdnVadGIwSVVST2tWb3JaeWRXbmR0OUNnVDhkTzlLRnlFc0NGSGVVWFZJ?=
 =?utf-8?B?U0UvZkEzYUpIOGEvTlZSSTdZWUpiQnR1WnhwK3JBUlpScVB0Y2lreW5UR0Vh?=
 =?utf-8?B?dWo0cVFyY01zRTYvRW0zVzhVajJkL29xTjZIclpydzYwOTdPVVB5clJNbTZz?=
 =?utf-8?B?R3dKaDlZamFpaHdsUmtCN1hzTG9tNWd6aWlxTVZlbzlsa0dsUW9XMnpEeU45?=
 =?utf-8?B?VkRROGdOejZHSlRRVlZramFkanBNenVRQXlYb3BWTnRlbmdYcSs3T0ZMQ1NB?=
 =?utf-8?B?emduTTNSQXNQSURjUzZWcTNYc3F6NENNME9ENm8rNG1qZzhZQzFRSEt4ZHYw?=
 =?utf-8?B?WmJOMjh6V0VEU0pIR0lzcFFvbU5KeXFjMk5kN0ZNZWM5L0J5TUY3TmI1ZHRJ?=
 =?utf-8?B?cVhLRkphNCtCaDhCR3RpYS8wU3UwM05JWkIxZXR3ZC8vSDN6NURZZE9OTCtj?=
 =?utf-8?B?ODJJYlg2NEt5dkp6bmdVTjdBRGtjb0hhbVA5dHltc0s1a1cwSlM1ZlZSTDhM?=
 =?utf-8?B?TUh6NHVoRHFNa3BTaEg2MGptTDVoSml2Y0FuenBnTUFHNG9ETVBUNzVCOUYz?=
 =?utf-8?B?bEZOeWJKZWliTzA5NlRvRkY5SG5maHJwaHFpRllOK2JPQUljT2w4Yjlid0Rs?=
 =?utf-8?B?Y3hobyt0bG5xL2lvWkdSOWtybVU5WGc0T0VYeTdJWHdtdWF3Rjl4aUJCOUNK?=
 =?utf-8?B?MGVvOFBLQW8vN0ppbzhlZWVhaFFBSGswbWd6OGlQV1dFbU9wMFZJMmRUMVpT?=
 =?utf-8?B?N1o2Q0g1aTZZRlgrd01qSHpZTmYvN29HQjA4M3BwejVBY1JteHQycHIvTVdu?=
 =?utf-8?B?VjVBRW51MkV4cUx4MEZ3UUx4YnNmV3I2SVVmanQ4aHVRUlhBUi9FdUgzQVpY?=
 =?utf-8?B?OUpMYnZWeTZqRnpKNFVEWW9oVm5aSUJqU21obWlLVGRoYUJIclErNWttM0oy?=
 =?utf-8?B?c3lmbGVxT2xTcTFCMUhCa0ZmUkw3cXptaDhrakRwYlhrRTNxai8yaTA2QW9R?=
 =?utf-8?B?UWFDMFJTcXNhNFdib0ZlZDF4L0E1YVN4MW0reUtrM1ZTRDF6Qnp1RndmUFZB?=
 =?utf-8?B?STJKK0FPay8zei8rWm5YL1NhcU5XV2grQUNKaUdKLzl0RGVWRWd3L0toeE5p?=
 =?utf-8?B?RjJaWGRqR2V3a1IrbEkvMGJZZG1ZZGI4eW5JRFVidDRwbVQ0b0F6bEk0eU1C?=
 =?utf-8?B?WENqcXM0RnEvOHo0WU9sSFdQOXQ2TWN0UjBSKytScThUN1ZiSU5aVHlzcWpq?=
 =?utf-8?B?QlA5VXhzQXVILzFQZHhGazRnU2YxcFhXRUk0VEU0OXROcGxkQ0RCOW9PUGla?=
 =?utf-8?B?K3E2c3ZqVWlyeHVGMUk5U3ZOQS9kdkhDUVN0d0tyK0xBNjNGUkNJQWdDWXE5?=
 =?utf-8?B?WEZOaVFmWVlVQ2FhVkpVbm41aENXTm9jQnZacndTVnE5eDJPNkF3WVVGeUxw?=
 =?utf-8?Q?sPcWxLMB898ffzJra/frS4LMprL41d7nF1lpyC1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4ddc3a-177e-423e-fc60-08ddb7832e9d
X-MS-Exchange-CrossTenant-AuthSource: PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 03:07:01.0109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB10372

Last updated: Jun/30/2025

Quick Summary:

- CV18xx: Reset, bindings & drivers are applied to reset/next, dts part 
is applied to sophgo/for-next. Will be pulled in 6.17.
- CV18xx: Ethernet driver updated to v3
- CV18xx: Duo Module 01 EVB board support, picked by sophgo/for-next, 
will be pulled in 6.17.
- SG2042: SPI FMC/Nor-flash updated to v3.
- SG2044: PCIe dts part is applied to sophgo/for-next, will be pulled in 
6.17.
- SG2044: more DTS nodes is applied to sophgo/for-next, will be pulled 
in 6.17.

Thanks,
Chen


