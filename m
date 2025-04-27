Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010005.outbound.protection.outlook.com [52.103.68.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24F61F6694
	for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 23:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745796748; cv=fail; b=ioyM4PfaBLkLZtoNtHhl38HPty5Xs9ZhM5beYZnVI6skWribcmRyvs3koIkDKJvOHA6Ak0P4o43tkIm8GCnPlamKFH4OQ09LxbAep/J0xaC781+ZqGjv+/IK9F+v9tn0unEowbfMjqDftMQl5nEn5GKAtlNt/StxhWBy2Kz6nWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745796748; c=relaxed/simple;
	bh=GR0GkSgor7o+Z28hMuyVXXPVOiuTiGfKnGtf2QEVsN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cMvv/lE2fM6Wmh2wCQu2rSj4xhngMMyXr4z8sp/DhLVT5WlwnK7yNEL9RlOD8xw2q7/Xq3GP6ODJrBwlhnLjTytQ071c7zSBGtYm8WXfAs0ybviBnp3x3Qxu47yrE2W3bhhQyyiWz0PAYlHQD6N7jNDhN6sughQOkvhbEN8qdkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OLldB3tA; arc=fail smtp.client-ip=52.103.68.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OLldB3tA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCHGHB7lhXMAVKJj0iKVQA3oOXmqf7KQV66maNDu8Quzms2S2vf2jO55d7+I2zguzEHYjRHsg4d9ZAwQh+WWFV7RXGtV+XeqFoNddGGKBCUmegvEU2eCzvYGNAxwBvMVaKEBFFjJg+0Ba1POlwSHxKQU/4QTHFhOJ/uj3DkpYeM/dL9dQWWQRsFo1m1Lxa8j7hFolOwiiLAM7xO4CEI1C3hW5aYrsZxShLQf9p46zbsUugkVUTmjSRtZRXspFNXByAX1SRGalAmZ/6sr1/m1Bo0UxLFuECKyrARpDxAGNBFPJUT2S38x9uFD3vNU+en+fZjUdhgYwSpfCJWTzz24tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qkNZ0UjWAW9Qk0YqnV48FPXwBEw98sFGO/jm9cps3s=;
 b=KkDBzYZ4oDh0xxK+j+34zCEz0cm2monJgf7G3vwEOUmg0pDrHVOilQ2BOJZXSsWTrIlSyDQUe/VQIFHGe31OlDh8fIlUSLePtPK8xeHl+d6lOJRAY5WJNhFyNYsrycckxOS/eDKQ/o9VDoFrZcZaQOn8glpMoFzodtXt3EOTLXqQGVSudGcKkg5WUZfuw1yf+KIIzkWUILRnk8Advxt0bUdzSLifmGUhfDR1H5SW7EwFhAoKn++c9Bldk2NG8g0UIQ1Ytx8eSbAoO0qfOGO+kg6p74SGi+rKusw2ThslXtcRnZbspm+DckwPPMd2wZggwNiZlgCNqDe+aKIcodXMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qkNZ0UjWAW9Qk0YqnV48FPXwBEw98sFGO/jm9cps3s=;
 b=OLldB3tAh9RlEFFtM7te1SbVQV7mB9c020TvxGotyZHX6p7tNF6BS0uVfvonfiF/f+u70VmPx1gC/BNTdZCaX4sUtoefyOAwSHXgcOhp9YPwUGUupevdK251I298mhkn1sPKR8M2ioOsDc0XP7YtZWoa/ikPl54c1F4Risf3aYzssLOx4kYgB4PNOq2AeoVR+VhH5qM6QjqbkSkaS/pUM65x4bCYHUL76OD+iLeo9pMcvXeTq/RSZJuU2Os+5HB0JF9E6yRh2jWeHq+XhwAcTpe4pO77dXjiIgOTKwDXn90eTJeYPab1aNbZelh7mIMTPHP6+ptA+lS4bscExHR5gw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB0177.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 27 Apr
 2025 23:32:19 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 23:32:19 +0000
Message-ID:
 <MA0P287MB226215965D3939739CB73FECFE862@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 28 Apr 2025 07:32:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/3] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
 sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
 <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <MA0P287MB22628A1AF7C3B2DAAE837CE3FEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <f2c8a44453d5a74f9878d1d45e3a61d8107ecaed.camel@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <f2c8a44453d5a74f9878d1d45e3a61d8107ecaed.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <fc06eb0c-2190-4a3c-a862-b8f3602b3f25@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB0177:EE_
X-MS-Office365-Filtering-Correlation-Id: e102113d-3f45-440d-fa5b-08dd85e3bf96
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|461199028|7092599003|8022599003|15080799006|8060799006|5072599009|6090799003|1602099012|440099028|10035399004|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm5lM25oZ2lJN1BuZlhjWVBtQURUR2ZPOGQ2S3cxNHN2bW1iVDE1ajd0WlJp?=
 =?utf-8?B?cHBJQ21xTSs3YjBxY3FheTNsT09PRUE0b3ZuaGVlSXkwbEo0MU9QUjdSelE5?=
 =?utf-8?B?M2hoa3U5MDZSKy9hbktJS0NXUk5EQjBLUXozT0JVNURGVjdmMjFIZ3o4Q2dh?=
 =?utf-8?B?UGUrQy9GUjFTSWxEckgyOWJxRTFBQy9hK0RPSXY4S2lieUlKUHk5RmtqRFlI?=
 =?utf-8?B?bGIzaHE4OHR0NGd1QkpzcGZtM3RsSWFnOWNRaWlRK25zWXJuRVBtaWdUcjlJ?=
 =?utf-8?B?SGlMdFQ4Q3pab0ExaDJDekFud2Y1LzlteU14NnJWNUdnUTRxWmMxaWhadmxJ?=
 =?utf-8?B?S3dWWWUzYTEzZ0tGUmtGeDBrRWxVRXpZc21xL0tianFIQVRtL2ZQQ3ZkOG4r?=
 =?utf-8?B?ZWU1NHo2TzFmSC94VnJSOFNESDRJVE9nR2xpdHkrMklKRlp1OUcvT2NkNUhU?=
 =?utf-8?B?U1RHTzVETEZEanQ1S1BwRldRWTgyT2hwd21FbFg4VjNhZWh4cGp4VEp0REQ5?=
 =?utf-8?B?Mm9wS3VvSW16SkMzeVdXM2ExSmZWbHNTTHJpL2dhYy9PVFFxNHllOFQ3Qmd6?=
 =?utf-8?B?Y0dxbUFkcXdkQ0l4cnFNUGdaQXlYMkdOYmlZbzBidUhacUY4Q2RXV3N6S1lx?=
 =?utf-8?B?d0pibHVkVWw2N0Flb1pIWkdidUZ3MzRuYWtLZWllMUVLNVJWQmFUUi9nM1dM?=
 =?utf-8?B?TWNmeFVWMXIzQUNpemNaczE0R0xLM3VWdFozaTdCc3FzUHhZUGVVSnNUR1Iz?=
 =?utf-8?B?VW5KTG9NNzdHZldXZXFNUVpsa1kzUTFqVFpVRE11M25sTHcveG8yUW1ydTg0?=
 =?utf-8?B?VUdhc3V5RENvbWZkaVZSc3ZVTDFSYTVzRHZxbTUzcFdyd1R5aUhKNkg2MFpo?=
 =?utf-8?B?M2NoUVg0Qk9qa213NUh0aWV3T0NCTEl1SDRyRVhCUWowcDFmUUp3SkR5aC9P?=
 =?utf-8?B?REQzMW9wek5Tc0RMWFNPQmJCZzg4QnE1TDJCbWVCcWsyQ3U0UHhLd2VNMjFY?=
 =?utf-8?B?UFZENTFEbmlXSVRkSk01QTZlV0VLZW4xa05QNHlLVkRTdnJsam5CRUlabDlB?=
 =?utf-8?B?REVqMHcyV1hxTjd4dzF2amw2NzRqYlBhZ3VpamJHZVJ0NDhleFNtRXYxWXJI?=
 =?utf-8?B?UFQ5c0UzY2hTclFyNHc4VGpqUVZTQTJPY21FM3JRQ1FQQ0NXV1Q2QUd3b0RC?=
 =?utf-8?B?TmRETm81bW9DSFJIaXFmRms0LzVpdHdKT0trZTRuMVJ5WkpZWG5GdDRnWTk1?=
 =?utf-8?B?ZDJrMWpDYU1JYm01aTdrVUVaTmZsNzh5RS9uNW13UGdSL1pyZ2x3N2ZvTDBy?=
 =?utf-8?B?V3BkYzZXMUkxK3ZHNFZpdnRDN1RhR05venN6RkNUbzdSRG5yc3ZEakxKRE1s?=
 =?utf-8?B?eENEMnljTHNwbnRLd1gvWGU4clpyd2FrUURxcWlIUjdLdC9VbVZFaDVWQ3N6?=
 =?utf-8?B?QXBRWStONmx3QnlTUURIMUZtZkNFbzQ1WDJVMUpwVHZyejllVmNIczM5dzNn?=
 =?utf-8?B?cTNEVVdKZEJvQzRYdXMveXpjTGhEQ29KWFYrNVhFeEY3MXZTVVk5T2p0ZzhW?=
 =?utf-8?B?d3RYeFhXMC9RdlAzakN6VVgzb201UWlnRXpQcmRrN0xLZ3NoelhCT3hZdnUz?=
 =?utf-8?B?RWtwUlBsbEp1aWx2NnNBT0RWQk9JMGdUajlaa1BIZ0duMURGa2lxZkxGY0lM?=
 =?utf-8?B?Q2VoQjhpUWFXLzFRRzEwUTFkRjZQZnlOWDhMUjNCVk9OTmZMd044VktYNzBn?=
 =?utf-8?Q?xLee5e90mgfYoL/4lQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0wxLytxZFZTVk95eG9RTWgvVzdTd2FETHJqR1NXbVdqbUpqZHRFbnB4M0dm?=
 =?utf-8?B?VUxWNFIzN2JKTFVKenZZRThTRTZDYjkyUk1sTFkxZHlETkFnTEVjUGFnYnJu?=
 =?utf-8?B?ckt5d3FpWHFrbUxCYVlTV1VEUGttRE5rMkFNUG5aazZlT2VnOFpYTERIc1FV?=
 =?utf-8?B?b1lLMi8ydVpodlEwb1RpaGZmdlIzcGU0c0ROM3ZDZWlsTWJRWWRpMk9zVEZW?=
 =?utf-8?B?cXlibUY5SDNGQ0NJN2ZWODd6d3pWa2wrTDRhUWgzR1JmeWtudTRTekJYSUR4?=
 =?utf-8?B?eGx6dnZiQXgyY1JYSTBsOG5ROTBTL2JtbE9DUDJWM3dGOXptZjlwRGFFdU9p?=
 =?utf-8?B?YVNLWWZiWnF4bmlNcENWVUpqVm5GcmtVejZ3MVp2Ymo1ZmRPdDIyRCtaNzcz?=
 =?utf-8?B?aFFmclR4WXlXcXdwNVF0RzFPYk9FSm9wL3FvM0dJOFpXZ1A0MlJmVFF5cDhU?=
 =?utf-8?B?bmNPaU1wWXlocTI2amsvdUlySFpRTFl4Q011clM0WFd5TUJnaHlFQUJXY24r?=
 =?utf-8?B?cE9RV2VHb05ZQUZSeXd3K3JLeGY3VUNJM0lZanFMYkEyQ25hcnlMT0JSQmhV?=
 =?utf-8?B?M05HdEo4TWpyb011TlUvY2FocmNnWW9PQzRiRFcvUUJBUzB6dmZ1a252SHBm?=
 =?utf-8?B?K1lWZ0U1cTNZdUtPdmtRcEJjaExwQUlmU2RLcCtPNDBEbDMrekN0YldVaWNk?=
 =?utf-8?B?Y3RlQVh5czJtZmJlTW81L1gwMGtYSDFtUzRDNmtrdFJnNTNacFRQZWgwK2pk?=
 =?utf-8?B?WnhNeEhIcE1FMFU4Z1M3bUxWNTRYanF3ZmZ4Ym92WFpTYkZIME5BeWRLMnBT?=
 =?utf-8?B?WTZRWTBuRHZXQmNqbTg2ZGtnamtyVXlYSEVKcHhVTk9hTmNaOWQ4UHBkQ09s?=
 =?utf-8?B?Y2M1LzBJOHFBSkpBb25VakFjRjFNYUVpRU0rclRmbk04a0pZM2NVZnQ5OUdl?=
 =?utf-8?B?S1BpZyt3SDhRT2xCZVlRQm1ibXBsc2hSdGxwTkQrdFRaNm5LSGN1QkZYeWlX?=
 =?utf-8?B?OHk5a2ZwVmlxVElHeXlUR0RPQ3hBSk9RK0dkc1V1VWtZKzF2WDBZRDJYK3BZ?=
 =?utf-8?B?elE5bitZNStUS1FGVFFwenM5VEpqc3QzbldJbWpKZ2pMUEFGbCt5Q0krMzdt?=
 =?utf-8?B?Ri9SRnJrQ2cvRkFJMmdpdlpKMHJnTWFjenJZSDI0dGI5MDJUMFoxalZZdjZY?=
 =?utf-8?B?bCt2ellzL0tHVEV3S1k5RWxsaWVSR2YxS0NNVTc1QzZkazVOUUhLdmtkYXQy?=
 =?utf-8?B?eXIvMlc3MytmdWJ1clRZVXpTT3Q2YUhIakh5UEE0b2M2Mmx1UUVKMWFncWh0?=
 =?utf-8?B?QlFpbk1hazFZa2FKS2hUcXNQaWhJdWV0b3ZBRVZHeEhDcTlGSHpGTWFqYkRo?=
 =?utf-8?B?blhaa3dudzJRTW9uZU1mZGhsQmVNZmhwWDlqUHZmWXNRTzBnSnQxNDEza0pY?=
 =?utf-8?B?TWJXSXY5Z1hON3d5V2NGamp5NEZHcjF4eG1XeVIwbHFGNmZQc2pEVExKdXRS?=
 =?utf-8?B?V3M0S1FQT2ZDeFpnWUsyV3E5MHJMVjFkNzhOQmN6blc4b1ZNQlM0QUhCdk40?=
 =?utf-8?B?NUFneTdZNjhZQmxVaDd6S3MzNDJxSnI2N2JQYytUUlRuaTRVYzl3YjdtRVJw?=
 =?utf-8?B?VEs4U0l4Yzg4K0ExZDhLdXJlekVHc1Vtdm9BTU1UY1Q2YXhqQXlReW12S2RX?=
 =?utf-8?B?a0RCbGcvNjFMYk9QSW1KcHdCQ0JrdlhSZ293T05Vdm9PUDREU1ZRR2dqYUtT?=
 =?utf-8?Q?qak88sM9jifH7GTjqjy0PsUg0pcTVhK+jZ/iO/f?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e102113d-3f45-440d-fa5b-08dd85e3bf96
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 23:32:19.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0177

Hi, Alexander,

On 2025/4/28 5:58, Alexander Sverdlin wrote:
> Hi Chen!
>
> On Mon, 2025-04-14 at 17:14 +0800, Chen Wang wrote:
>> I just find there is an exiting "REAL TIME CLOCK (RTC) SUBSYSTEM"
>> section in MAINTAINERS, seems we should not pick the rtc file in "SOPHGO
>> DEVICETREES and DRIVERS".
> But then the below mailing list will not get notified on the changes to
> Sophgo-specific RTC driver. I'd say it's rather about providing timely feedback,
> like Tested-by: and Reviewed-by: than any other more serious burden.
> What do you think?
The rtc driver, especially the cv18xx rtc driver, is not a special case. 
Other sophgo drivers have not been added like this. If it is required to 
draw the attention of those who need it, we can copy 
sophgo@lists.linux.dev when submitting patches.

In addition, regarding the rtc driver, it has not been determined 
whether we are responsible for the PR or the RTC subsystem. I suggest to 
discuss this when it is determined.

Regards,

Chen

>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -22354,6 +22354,7 @@ L:    sophgo@lists.linux.dev
>>>>    W:    https://github.com/sophgo/linux/wiki
>>>>    T:    git https://github.com/sophgo/linux.git
>>>>    S:    Maintained
>>>> +F:    drivers/rtc/rtc-cv1800.c
>>>>    N:    sophgo
>>>>    K:    sophgo
