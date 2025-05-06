Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386619CC0A
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 23:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575234; cv=fail; b=q2GIb4JrGJ7Hm1WL4bffy72nMGgCgEcMhf70iYn5ibbUHbYiWkBGtJILNCEIQSv29pnthuvkIuarcJauXIYt+WGlbrWZ1gkQSImda2GiAlB7a3Jl5f2WBQMG//YSnNxLJN3h1A7+gm5kcfNwEQzyCZtyslQgCWDmYYX2oP+6vwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575234; c=relaxed/simple;
	bh=l4NaefYxzxJQ/hY6imAQ98d3nVoOJ2WhJ7LLf/0nU3o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z9hijgtEwVATjhdMlQ4sDwaXbfoDZ0ktyStvaYDuJfBFOieyZUonDnIFjQiUtyzPoAochIlTRxPI01XAETK0tWMU3pp+D6Fgvqe+0W/2aW4Xw/Ol77264Tv77cyp+IIOfUa8oKWzSM32BSGrOb0YbhjPyEcJvvGrHWvR6/771Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=G1zBNM6v; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="G1zBNM6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPD4bZ58MzZc2GSI4JuJBMm8c/N+7IR18AqZLeYzDJ8rpwRTkxwd2m0bfAL590z9M4c/Fl97rSA0qeEsyEt/JVLJbEzE33zM9mMxpjrLjAH1dtGcXhTVcm63aDUUad8+U+3oTROj4NfqUnywEJ5xjFogXubG5SPLxCeCMV4xBidPHYN1R4IsEELAkT101hfVtoI2sBHUQK1AAdM/XvZIqbpzNCI0cquwFVc3hZHd5DiQtUp+AstHnmDMd6xz6mKsSzx5+DwEH05URuShiR/xLGpRHpacbo2ZE0f4OJD4A9gdlVMKSmaU08nUI4pyScIYI84x8/UQrKTYb490LTSGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kyGrcQrlvvdGmqVdN2VSZHUd907pzKpz+OE0k/37Jo=;
 b=XHva0Rd1TsVs0cqiBoVoy1yCUg76VZOAsjjUUCH6PxGwsyeboYXyzskSzrwzXaYcp4duhXip/Yt9gmM83PNjBsWmcsVEwE+upARv2NbbApToo39ewa+2m6RONoDvc3/voR8ywcFvPJU0cgtFxH+0Vx+1NwLkBlhvLchGAfPRVk+gDoSbPhEl+exM719m3qoHjzcxGhQlad7VimwRST3BgRiwjXTXcKGyFgHKn6iIEkR4NIuxE8VGktpuEApVIAugUUvrPm5iIaP4V/kUzs9Y98U4p8RgsOq5NIl36pIp+3DqiIMW4K2So19oIPD/NwmSHyJSSW2fae/3yL/RF59csA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kyGrcQrlvvdGmqVdN2VSZHUd907pzKpz+OE0k/37Jo=;
 b=G1zBNM6vG5WXRxTONF6/7Sr93O4ZGxfg5+Te+tSJUmAmMvrjPkZG62KAfvgdapypyq72Q5SrQLyMwoQVlmGeI2d7XgQvROetjP1jRWaXxXW/iT3fKH5jZyL48rvsQx/RZJugPcEtGjrGLf0XMTEKdU0dWDx2uu5oDeXBdvUmo7ZOL959dtiH0rW6R1Daxj1lSNLbw8mw7rpBLVTRYIy53u2xYhiooKcjjF8feiw15jcwXGF40Af3OmHOQwjl8JY6/k1Dk7Hz1K8Iv2f67jB93MmQnyTxYe+BSU3VJWeo3CjHMN/4DnsFAwzRgn4oUaRjQfTgbqmXnmGz/QwcCLYmDg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB2064.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 6 May
 2025 23:47:06 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.018; Tue, 6 May 2025
 23:47:06 +0000
Message-ID:
 <MA0P287MB22624C0C1FC0886A34C69BDEFE89A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 7 May 2025 07:47:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
 sophgo@lists.linux.dev
References: <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <ba5ff45d-c156-46b9-a6a6-63298996e5a8@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB2064:EE_
X-MS-Office365-Filtering-Correlation-Id: ac430503-88a9-4cca-2053-08dd8cf84f1a
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLR0Ybdxcp7KTbjbpYD2CblCtN0QkC/LSJXZKUSJzv+XDX6LATgGNqbbD596AjggGBZh1hWxqdubAVq0cn7lXSzITrwnhBQoxnYNhC2pi4ZxKcSuQq+CQWN2PrEfD39e/waB0bIUPm4UY9sOgC/+7c6kzaMWUCDYPZwj68PQgQXg0TXLoGrvWQX9W0wWPIfPiVqJU7NXblDMTZQNY8SEE06Pu/2rLMuYdTBqM3IE3j3k//QzXP/3pHaDkYfL0sAH1h/PvYj2obKBsl9OPOUlOtWqI++zIn0j0MXnZsseezLu+IEcsF16tKsMboHIqPCKTqPS+NdeSGKZFWoMiVz16cyGU9co0lp7vjrag6I2fdfg28iAq/F2LX06rEGcNmXbAkA5ed5g49CLBmTKXLlHaIKi8yJvd+DbRjTgD+b5/sZdsQF7Ck9hkU+BbezzfJqiv/xs3FOlOe/zHLoKT/yfLe7q6Fx4c5QucQpnpMLRsbOOAdR8LwYFYn8aXDXxpXH+vxTypfE7B+r87h4yBqPZ3LQwKz9gTbHnLKpSp5IRWKvaepQH8E0wnEOmiRJ1xwxwVpui0to5EVSxOwLnFDlR1gJXnpSMoSfCiznJr9KQF+BmoGhHonkw+qkTaDSJu04mnYgLtsvaX2Twpvp6macSONhO4dDkxLsjsgHqxNLZ3r23htQMVwZh19aRHI8ftZ39ccLN9AKSFXvZHbnpZfCrMoN0rRyuPW8sQKgT7TUiTtkkdVePztiqdRBYHeIWMB8QarhvOC/60X4LgyAqK+a1JP8j
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|8060799009|15080799009|19110799006|7092599006|5072599009|440099028|3412199025|34005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SllwRzZRZUwzZFQxTWRMU1RLdUMrTmtVM0ltWm1NMzA5a2UrSWZzS1U3MVJY?=
 =?utf-8?B?c0k4QWxKQ2dSTnNxYURwcXMzemJSMXIzdEhYWVhRdHd6OHk3aENMK2prejZj?=
 =?utf-8?B?TXQyK1F2b2FZRlc4aEJmV1RwQjltckxzN21wNVIxMGRuQ0QxZDgvRTNQdWhZ?=
 =?utf-8?B?OUhJZ2taS3o3Z2ViMkJCbFkyaExaTEQxQTV5ci92N0swYlp0RFNTYmh4RTVu?=
 =?utf-8?B?U1lxaHRmdmd0dFhhRjVkYktqMXk2cHAwald4NXBZSlpWL2V3YnE0NktUWUZP?=
 =?utf-8?B?UDRzQ1B3SEtKYUZuemtBWnA1M3A2dmFQTjVTSmNVcjA0TC9tVkdFVFdnbWg3?=
 =?utf-8?B?RHpMTXFmNnFXMGlQOTU1REhUTGdVQ1B3cmhoVVlDTTAyaFBYbzZnSVBFWktz?=
 =?utf-8?B?azBEMEhldnB5NmdORGZCK1FSNW9IaXN1cUJWYjdmT2l5YzNHeERqL2s1WjhS?=
 =?utf-8?B?M1NKSjc0OEdST2tDNERQWUhjZ0R5Qm5GejVmK3lMc1hJNUppdU9WMjJZRW5n?=
 =?utf-8?B?YVcydmk2RjdYNmFNU3AvZUVNVnB5S0RFQUJlODdvV0E2dmU0T1BZK09sNTNu?=
 =?utf-8?B?ZjVjVjFvcFNuTDl4OEg2Qld4QTNUZ2Jlempwdi8rTDErTFFnZ1pYYnQ3NDlz?=
 =?utf-8?B?N3JDK3ZveTJhaEw5UG15MmxyMGxrRElVazd5VmJ3OVYycDBRak9iUlNOWU5X?=
 =?utf-8?B?WTRsSFd5SmtCRFZTL2xhNm5ONWtwWnNRRC9DeHljZXNOeUR3THk0bFczQnZ5?=
 =?utf-8?B?RHIxS1dEK2F1MjZiRktUZXJVZWtleEtSMVdCcTAvZ3JzVHMrN24welVQMTNq?=
 =?utf-8?B?eVhGSmZSYnM4bkdLZlhsZjJYTVdDOUR5WDVZVEszN2JGamowMTIzNUpRWFZZ?=
 =?utf-8?B?cVFMQkR0eFNZWExPZWFtUWJBSkpoSWxDelJEbU4xWGd3cWRQM1lpRk4zS0Vz?=
 =?utf-8?B?MGtLRjRvNW53cVhtYU9yL3BYeTBGbVJjSHBYVE55bGw0NGFBalo0bFB5VWpQ?=
 =?utf-8?B?UUsyM1UyR3hpSEJGWFM2MkY2cGI0THVjTW9OZGEybzFCT1ZOaC9LWnNGck1m?=
 =?utf-8?B?WVc2dFBDbEhvTXhZNWxuMytYamo1R2VpMkhVcGVJdTlDZWxJVVZKTGxjTUpu?=
 =?utf-8?B?MDE2YkduRStsUmN1TUxKaC8xQ0lZNWxSR05OY25ldGNHU1EwUnA0NmxBRlFM?=
 =?utf-8?B?Yy8xNEZFcVpPczE2eUNYeVdQYjJCdVdKc05yQnFaMmVRRnZxQTQxTU84bllp?=
 =?utf-8?B?Y3RQMldlZS9tOEFHTHNrK3F3cGdMVXpQQ2JRM1R0djQxUXM5VmFzY0FmNUda?=
 =?utf-8?B?Mm90UjR2ZHMxTmlxR21xRDVYUTRLeUlxQnRnS3o5TVBaY080NldTZzRQdmZi?=
 =?utf-8?B?SFg5YWZwUEZncDBLSTc4Q0VndWIxenl6TGRFOFFxVFR1UHEvQWdZdWJQYU1p?=
 =?utf-8?B?UVlvRHpTUnFXS3FCbEpMV0tEQnl5Yy9pL0N4dHJrVkFTS2F4UERRbnQwd09o?=
 =?utf-8?B?V25TZXpHK0R1bFE4bHFKYUJ3WWkzRzhNRUhDN29lYmluQzR0MWg5TW1ScWo5?=
 =?utf-8?B?RUVUejJVL3JSZ1pVNi85MlRmeHpHVy8wWFpsYUltQjB3enlxUFFIQVRBaXFs?=
 =?utf-8?B?ZmE5NTRPK2o5ZitZdFIyMTNiQ1V1b3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGV4d1p0Sm5UeDQybXRhM2Npa21oaVFNbmp4UUtFc2xQVnl6Yi80bVd2SzI1?=
 =?utf-8?B?UHdqQWRONTJpVzI2OG1wemljbDdETzFNOFNqYlhhaEZSRFZ0cU9ZbU1NVDFJ?=
 =?utf-8?B?MVh6VGd0anFZQ1c3Sm9IOExLV1YvOXZiaWl6T0RlWXo5bmZpTk1kWDRVOElO?=
 =?utf-8?B?eU9OY2NiVTI4WTFSa1NMWEs1NzduQ3VINFNhajY0bzlCcUR0ZHFxanJncjRp?=
 =?utf-8?B?OFM1TDFlSzdhanF1TGJNVVNIK0JMMHJERjlrcmR1cENmWGc3bWlNM2UzZGt6?=
 =?utf-8?B?NVRQTGRiYmRCQUd2WXVGeXBCNnU4ejh2OEhMekRBNXpFY1ZOckFJZ05PVGNR?=
 =?utf-8?B?TzZUV1FCL29RNVBYRFMyN1FYRGhHVW5QbEpWdjNVRG4vQTVYNG4raU1XTDgz?=
 =?utf-8?B?MC9KQTV3MGlzY3huckIxYWdlWXhmSUhZM21OemdKbTF2Zm1uLytSV3dENmxt?=
 =?utf-8?B?TXBLdWFSTVVxeTBqUmdOZVRCOVp1Z0YyeCttcmxkbG9lWHFCQWxoN3FxM2xM?=
 =?utf-8?B?WkF6aUJqSC9zMWxOVFZZZEhEMFVPb3BmL2RXNEtlSVdMbVVoMDE5K2dwSlE3?=
 =?utf-8?B?NHJtM3RiRFhnQTZiSE1WSU1FdTZNRmpMZENCZ2VYa1lQU1BULzYrT2N1YW1P?=
 =?utf-8?B?TllNZHp3LzVQMWNaSm5hNTRLNjN4Ly9INk1NMG9qNGdybjlmc0w0SHJyM1I0?=
 =?utf-8?B?a0gxRE4xd1M0UUlYekdteUYwTzJROG5WSUFyQXc3TmphdlNiRXBYRUhYRnp2?=
 =?utf-8?B?MzN4RlNPdExxSVVhbVl2S2FlNGZKblVZOGNQM3JjT05NUTBDTnkvK2ZXWmZW?=
 =?utf-8?B?bXVkS24yMW54SCtEZSthN3lUT3FXN2dSc2RmVEsrV1VMcUV4VmlYTEhlOFZh?=
 =?utf-8?B?WFBsTERRY210amZvS21UWWFoREdtVU9ZcEpqWjZQNkNzbmtTWTZQZExZRStK?=
 =?utf-8?B?MW1VRk5iS1NuUkxzbW00a2dwZ2xzZnE1dWM4MGRnb2dhbk16Z0pjTnk4SUpa?=
 =?utf-8?B?cEQ2TlY1eEdyZlFYalJFNTM5MVBzMHNNRlFES0xDZnJhM2V3aTB2b0lkQnBo?=
 =?utf-8?B?Q2ljekp5enhJemRuT0JiOWpKdndCNlQ1bGtpRy9LNDlXWEFoR21DbXdZcGtj?=
 =?utf-8?B?ODV1TWxYTmtzT1UvbzVYM1BKZ1BoZDBUTzZiYVNEVDc0UEczcnJnam0yU0Vy?=
 =?utf-8?B?eTRVSnNqVzZVS01tTzRXaGxLcHQ5aXdoamRmTktMVEpmeDU3alFTNlRBeDlo?=
 =?utf-8?B?RWN2Zkd4MEkwV3ZPcGRoNVpmQXVWdlUwd3VXa2lwSGxkeFhIcW05T1BBQXFv?=
 =?utf-8?B?U1NmWjBvemMwNkN5c0k1eXNLc2NPRHdMNjNwdHpUWDROY3JhTlFuN3JZSXVv?=
 =?utf-8?B?c205OXdjeVNCQmpKQmk5Q1pCeUJCTTBTTlU1UFVDa0c2ZzBQeTRuM1BoZ0xy?=
 =?utf-8?B?OURJNitGT2JxMVVtVDQrQjRpOEZ1V1J6NEp1aFFuKzYyYURPem12K21OY0Na?=
 =?utf-8?B?bWVxeFZreml4OVAyUEY1ZTFLTWg0MXJ4RzJXSWc0STRTUDd1aFlpaG1yZXc4?=
 =?utf-8?B?VFp5eGR4aHp5K0hvMmY5WWxscFNRUHo4T2hqcDloV0prYkhZdENiMUozUU5z?=
 =?utf-8?B?c1RmUDhaN0dJdHJUUTVtL0M0dkRUcnRxa0UveE5vR1Y5WTBkMktTamNITFZ4?=
 =?utf-8?B?RXBKaHp2NVd4N2lEU2ZpeHIzaERJR0VBN29Valk4eEVJSGVZeng5cFNFb3dt?=
 =?utf-8?Q?4gJ3nBvaWeAtqG/zdIBxQfJi3SEqvsec3y58sEP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac430503-88a9-4cca-2053-08dd8cf84f1a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 23:47:06.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2064

hi，Arnd，

Have you picked this and submitted it to Linus? I see rc6 will be 
released next week, and we are working on for-next and hope this bugfix 
can be merged first.

Thanks,

Chen

On 2025/4/30 15:29, Chen Wang wrote:
> Hey Arnd,
>
> Please pull dt fixes for RISC-V/Sophgo.
>
> Thanks,
> Chen.
>
> The following changes since commit 
> 0af2f6be1b4281385b618cb86ad946eded089ac8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/sophgo/linux.git 
> tags/riscv-sophgo-dt-fixes-for-v6.15-rc1
>
> for you to fetch changes up to 3e6244429ba38f8dee3336b8b805948276b281ab:
>
>   riscv: dts: sophgo: fix DMA data-width configuration for CV18xx 
> (2025-04-30 14:51:43 +0800)
>
> ----------------------------------------------------------------
> RISC-V Sophgo Devicetree fixes for v6.15-rc1
>
> Just one minor fix to correct DMA data-width
> configuration for CV18xx.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Ze Huang (1):
>       riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
>
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>
>
>
