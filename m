Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010014.outbound.protection.outlook.com [52.103.68.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6231D5ABF
	for <sophgo@lists.linux.dev>; Mon,  5 Jan 2026 00:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767573511; cv=fail; b=XOAt/4SPF1/fpBN3xe/LhcYtygN51SUIt1kx3OBZkN3+ppOzLL2pXYLZiBlYjPduGnENbVr7u8Mh9GK8eI8mzYQN//A9G++kgKjkmjvr65n6N3CDutINsAUUBwdStB6T5i2nSOPpWmYr+96xNlTRLXa+fUO199hH0mxxr41blRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767573511; c=relaxed/simple;
	bh=7OtL7DuTFaBF8fEW5OFiQcZCUSPJ1A51KdV2hkMsDwI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FEk23NNEaXf5MU56aEH3WrIKlbJ+GI27AP6/1QtBG4fXux4KKHTx4gOm+Fh4jiWlyNxY7BwiW8A+VX9gn00aPZ8bjLFo2th7H6pHEDFNUVZoj5Po47J12Hucbnse5Sa8dsrpgSZXZ85G41sEfRGXozTr4t0wsN0pBeXsyk9g2/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=XHYnX5/z; arc=fail smtp.client-ip=52.103.68.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="XHYnX5/z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVNho1IFBn7mzJME46/3Vmu20wT861YMNun8DQOpPhmeLXRm8uLlB28tMQ6l9uLqFSxApgOjSJHPBl4q+dNdrylKTaWtD/UQxYgrOePp297cQkBbPPg+4bZ7fGIeeyq9pc+o3oMaOe8fSRzXMPhGFXObtRi7+GBe+v4IlRC/1q5kxSC3eN6lyzMr58X7ZdjG9j74OdwxKefu7hVeP6Tf0mxp3/APoWKJOMREkxxUbgkFVUF1sj9B+Q2Jx/wmTgGb//ABezXQaOmbqRGUm9V9wRngBqQdcQCMa7HaRZXPuMhBbq21O/TNGyK5fjvRmsJeRNTzfgoMsBQH3GyOGkAssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql/n+O3yVBLVW1RIZay6mPxsTsRsiOC2kOjjT16O6U0=;
 b=pDAQdMW/19P04VTIiylfpt7NBM716UE7/oEKy6kkai+ruAT1Whq6rTZTDXOSRVpFCmHgwM//Bomfu5SeZvU53RUbfWkgG9eEwI571NzlyJ3Z4sHg1GVpq5x2RP3jcq0tDjBmpRyn+rdD634cEH6a8HwcwmEY4iM/ZG4SwHHNmWof+Sz/7nqgptm/ykekgGYtYWVOySxZfIQHFTnHPmoghbAPvlmWY9ryTDXNQ9Y96g5fJpmlO18447eaCAGRKIhKs9kFUwUnCvLModu58cLNs1BwKpylfoRSExhwoo8ZHGDDyn2vBhLVZbA3XVqjE41djO81DTYM/XIUQBBd2SlWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ql/n+O3yVBLVW1RIZay6mPxsTsRsiOC2kOjjT16O6U0=;
 b=XHYnX5/zOwYcXHegguoy59DfwkclkrqpshUM+UxOcrsKFfZSaa/B4upRFJOhl8gfMYmzAzMucJNgnHmfcAoNNSviDv43Eq0gnGOlCHHGPaZq8X2qHEjN0ch2jdfnYd1rqi+de4K0973zPbeNy4YDbsdBP0WuEht1RPhELcThlSBs8XjGrWKeqKWXBikHtDUJDvUynOV62gwGXZpqVx4b4p5umeb89fGhdR7mKnavY0Jg6ytkB7t/oYNON1/k9TASdMiA50XPhH2le5gLBubpvlRMnMjYRoqmXa02ym07lXWmrMW29i42JdHR1cvr6xo32A6IaOWoy/I1kagOy7aaaw==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MAZPR01MB6830.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:40::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 00:38:20 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 00:38:20 +0000
Message-ID:
 <MA5PR01MB12500FC54D309ED16E01ED380FE86A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 5 Jan 2026 08:38:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Hardware clock on the Pioneer
To: Michael Orlitzky <michael@orlitzky.com>, sophgo@lists.linux.dev
References: <aVRYtrWucN0x4wNm@mertle>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <aVRYtrWucN0x4wNm@mertle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <8d48125e-6705-4fb2-b70e-ce79ff8aea5e@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MAZPR01MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cc1c46-2f25-47f0-beac-08de4bf2b910
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|6090799003|23021999003|8060799015|461199028|15080799012|5072599009|1602099012|40105399003|52005399003|3412199025|440099028|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N20xbTR6WkNMaGI4eHpwYS9xclYxM3ZhUEErTEw2VTk1RjFhV2tudTJPKzA2?=
 =?utf-8?B?Sk1sdjl4cU5PNFV4b2NtTS9KTWtySTZZUUFFMXZkNmVDTUlkQ0FUOVRFSWZC?=
 =?utf-8?B?NFM0RHlVU0pQR2lwU05CSnk2T2szUUtTVWJySDl6SzNDUVI2bWV6OGRKeUVK?=
 =?utf-8?B?cEIyL3F3elA5VCtnUGxwR3FIZWp0cnpLc2c2T2IvUXdSdkdTUEd1cG1FTEdP?=
 =?utf-8?B?VFF0Smlta1ZMbUIzQUMvOWI2YWJvMkJwajQ1U01kcjFKSDBEQVdRYWVWb0gy?=
 =?utf-8?B?SnZTYng4akI4Y0pOdFg4dVpHaWttWGtPU3BmbWQ2OEN4YXBuSDgxYVBHOW1S?=
 =?utf-8?B?SWZHdHdQcjJaVXJ3bmVFU2I1dWlkS0I1MWpkeVJOSmVnOG56bFd3SnNYMVZZ?=
 =?utf-8?B?OHYvaDBPaHYzUmFUVnZMTUNNNTZCdHVqc3NNQ1VBMFFHS01ycW1FZHZWak9w?=
 =?utf-8?B?VGNLRXdxY0JOemllSURNRzV2K1EzRXhLcDhoZ0pyZk9XbG5VZVAzaUYwUThr?=
 =?utf-8?B?Mk5tMU5VR1hJcXFlT2toN28wR2gxblk2VlVjQ3NWeEI0NGJML015OVBKNVlJ?=
 =?utf-8?B?OGJxUDRlL0NmRGFjWnRBWmE2anlaQnIxbnFLTWFnUzNQU1IwRjRYUG9wKzFj?=
 =?utf-8?B?bnpoZGNkejJSb1RPZFJ1TitKaU0zZ005a3FHc3Y2M3RPb0R2dVkyaXpnLzkz?=
 =?utf-8?B?Q0F3aEptYzVhWi9ROEMySGN4c0VDclRBK2RkZmxBbmZ0TFQ0a0NXOTNIaXJN?=
 =?utf-8?B?enZqdFBTL2o1b0duZ3BLT0ZxclRrcndLdERVcUk0Q0ZaN1BaRGExMWhkTzIw?=
 =?utf-8?B?WnovRVpwZExaQndEZEh0VTFVRTdyQTJVbnlEckNCdmJJbk15dnNKR2xWMm9h?=
 =?utf-8?B?YlBoRGdma3FJUEE1NlNUOFY2NUpaVkNybU1aOTU0UzRraEhCVHd4SGFwOUoz?=
 =?utf-8?B?T3ptWGZqOE1tL3R4N2pETGYxZ1ZlVjJoNnY5UVhwZWVoc0FiOStBZm1CKzEx?=
 =?utf-8?B?bjZmc2pEaVJwYndYbDBmVzcvMXVsdUZSak91R0V0RlpNNnMwMWFFOFlHN3BQ?=
 =?utf-8?B?a0ZZQ3BzOVpJKytKOE1lLzl2c1RUdEFYNDNCbDhOMlpmRytBeVhTeEIvVjRO?=
 =?utf-8?B?RXVYNlRzeE9sc2dkUVNzS1U0MU5Bb0ZJL2RDNVJZbElhYlZ6Mk1tRGs3aFVY?=
 =?utf-8?B?NFpVSi9EMUdFbEp5eU10b2NDUmMzeExzUmFhU241T0drNXpEcFNCRWZsSWQz?=
 =?utf-8?B?aTlQeVd3a3dVenZMd3N1dGVmSFlXanJJL3B4ZUxJS0NCTCtPdktWMlNDb09m?=
 =?utf-8?B?VGY2NW5qcHpyOHEyNHpkRzFpYzBybVloV21tQkM5Rks1UU0vT3hUUnJOZUdM?=
 =?utf-8?B?ZHFXQnZoZEhDdTZWU016WjJwSGh5NS9sRTVWVXRQc04zWFUzc2c2SVBrSEpX?=
 =?utf-8?B?RndrTXpXaWpCU2phdTM1cWpnSEZZbkQ5SURqRHRyenJZdHpTeGFDaWJOdHRH?=
 =?utf-8?B?M3N3VGJQK2ZLSVdSYU5oYllwbGdWSjZORmdRMWZaNEp0WUpFalB6cmpZbmJq?=
 =?utf-8?B?Q3pEZ1ZKK2NxYmZqYUFNWHQ4dll6cU96Wkg1OTJ6N3Bzem9YVkdIbDVUdTZr?=
 =?utf-8?B?RmJsMkd6SERrVkxROTU2SXBSMkZ2OWtoMXE4eU5WWmxFaElxa3BmcGlQTDM3?=
 =?utf-8?B?a2NWeE9mbkdDU0svMWR4ZlNmcjc5bzFOSktOZ3RVVG5uWTNKMmVlYlFRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFVxWkxFTDArWXNkeGZGNFNWaEpYa3N5WkFCbXRrRmdJY3YzTUNjb05DOXpi?=
 =?utf-8?B?N1c4WUdOVTVla0F0Wkw3Z3JTR2RNYXN3aFE2U25RRGNaYzZ2U2p1OVNlaks3?=
 =?utf-8?B?VlR3WGhBN2lzWHdILzJCK2hiRURVbmxEcG1lYWFNUWEyVk1oNS9ZM0g3REJM?=
 =?utf-8?B?ZnpOZGhZV3hGenNqQlFzTDhCc3VXVGsxV1VzMnJwT3dtSmhwM1ZlVzAvTWdS?=
 =?utf-8?B?MEhIOFNtbjVaYUtuNmFyQVI1akMrWVg0L1grNyt1Z3lXK2JhWXh5SVdDSkVO?=
 =?utf-8?B?MFR1Wk5WeStNTlA5Q0lMdzlVU1d1MzRRWE1UcHo3TXZWSFRiY0RoMWhZV3du?=
 =?utf-8?B?QnI2T2FKaGMrVmVaOXJIK0ptTUVQaTVLQW05RFJFQjhMRUMzOUVhdFp3VHNK?=
 =?utf-8?B?Nkd6c1U5emZ3R1FoaHA1Mm11YWFNNXpmbGdxc1U5eFhUSm9zWmxsVlkwRDc3?=
 =?utf-8?B?SXRhZCtTTXFOdXhKazBvSXp5cFRVUXBad0R5SmhheDFaV2NPaFhkVUVEckxP?=
 =?utf-8?B?VStVZDdWVE8rOFlHMVdQRFdRZlZ1MjB1c2pzN2RJV3BXSGhkcHdCcjkwdER3?=
 =?utf-8?B?VFBmN1JEVHZaVjFnSVZqbS93OW1yRFRiT0Y2TnUwM2xJeTJkZXhHZGc4WURB?=
 =?utf-8?B?WnVndEpPZTBDVngvVWNraWd1RHZCeWVHMVJKcnFFWlkrUVdvNHhTYlhySnV2?=
 =?utf-8?B?cGh1SWM1QTdGQlR2UnRqdjJtYjJiZXhLUVhnMjdka293WFp3RWVwVGxoQXJJ?=
 =?utf-8?B?eUNiT3ZINlpyU21tcHB6SExMeUFlelNwYkRIcjNiNndpb2MzRTE2elZwYnU0?=
 =?utf-8?B?VXpUeE1vbHpyNjkyY0ppRlJWdlV1b2Z4eEQvUmg0T1VQQmlKc1J3RVdWOFZ2?=
 =?utf-8?B?MzFuRGpxN3NvRDZwaEVoZlZxK2dVb0Q5TkNUMy9mTTFCakJOYjdKRG1ybG54?=
 =?utf-8?B?NHlCTWs3UXQ1QnorM0JRNTVrRE05aTdpb21YY2p1TjliUEZ4cGF0Q3pLU05u?=
 =?utf-8?B?Q3l5K2RodWZBOExEUmM4d1lmcm5jU3dMeTZyVTAzTzN0K2JEVG40cWxjcW5P?=
 =?utf-8?B?UlJ0ZEJTeTAzL2swN3g3QUpuZStXTDBKWnkvSDJ3RmJFVzA4UjQ4ekNGV01j?=
 =?utf-8?B?VEJEVUhIcG5xOXRHcmZRQ0xLMGd5bjhEM0FuS2RxbU15NWhBcEw2UHVobVVN?=
 =?utf-8?B?b3FWMzQvVW9YMk9pN1Y4cno2SHV3ZUFHeDdNOGxvUGFxQlpET0V6Tm9xSHpY?=
 =?utf-8?B?VzlWUFhCVEIrU1h3MTVYSkszVFExZlQ2UlFFSktackNjSGV6ZE9ndm9Xci9N?=
 =?utf-8?B?SjNCVDZaYmJYTDVYdTZpZFQvdVU1NEpHWXpYWEN0MkVQTzhUb3k4Y2VmcWRP?=
 =?utf-8?B?eHZxYjdRY2JPdkVKU3VNbXU3cWxEREE1eDY5TWxkZHhNVEhJV3IwY29OejNO?=
 =?utf-8?B?Z3hFd1VQN0dua2l6WTVBRXlVRkNDak1HMlhsMUFDMVBmS3VKOGdEdURYdklK?=
 =?utf-8?B?eVRsQytYMUcxcnoveUZRbVZJMVI2L0NzRS9ENlI5MVVpS0c2OEZMeGpHSytI?=
 =?utf-8?B?UFhpNU5kbHllZ0Q1bmlnZmxISURndU00SnVzakxvMG5DZUVsV0pHcC9zejlv?=
 =?utf-8?B?Q0NPZVpjNnRqWklNUkVFaUszZUtjbDlCZjUyQ1p2d2VzV0d6eXpVOVpyekJo?=
 =?utf-8?B?T1FNQjUyNGhCcjhxSVRIQUVuK3ZvZ3R1VVZiZCtBYUFoUDB3USt6VnlLa3RN?=
 =?utf-8?B?VXNTQjFlakc2WHlkMS9BeVVPZzNGeG5UUFM2dW9qUC9GWVRydFE4bWZpaEFk?=
 =?utf-8?B?azZwRXJ3MUhQSDlPb3BJeE9xa2NaMVZqT3pDS0Rkb3Vnc3BWcXMwV09sK0Jx?=
 =?utf-8?B?RnMrTC9QUHU0VkRIOUxER0hSaEUrN0ZQNjVCM2RZU1pzLzdxSmo1d3N6MFk5?=
 =?utf-8?Q?iDs8ZdHb/hgGWttmLbBEyMpY5FmgM85D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cc1c46-2f25-47f0-beac-08de4bf2b910
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 00:38:19.5602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6830

Hello~

On 12/31/2025 6:56 AM, Michael Orlitzky wrote:
> Hello, I finally have the upstream kernel running on my Pioneer Box,
> and I notice that the hardware clock is not enabled. I've patched this
> in my own kernel (sg2042-milkv-pioneer.dts) by enabling i2c0, defining
> the RTC,
>
>    &i2c0 {
>      pinctrl-0 = <&i2c0_cfg>;
>      pinctrl-names = "default";
>      status = "okay";
>
>        rtc: rtc@68 {
>          compatible = "dallas,ds1307";
>          reg = <0x68>;
>      };
>    };
>
> and copying the pinctrl bits from i2c1:
>
>    i2c0_cfg: i2c0-cfg {
>      i2c0-pins {
>        pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
>                 <PINMUX(PIN_IIC0_SCL, 0)>;
>        bias-pull-up;
>        drive-strength-microamp = <26800>;
>        input-schmitt-enable;
>      };
>    };
>
> It seems to work:
>
>    $ sudo hwclock --show
>    2025-12-30 17:54:05.093606-05:00
It looks good to me.
>
> Is there a reason not to do this? The sophgo upstream status page says
> that the RTC is "Low priority, may not be needed." But if the above is
> OK, I will submit a patch for it.

I don't quite remember why I initially said it wasn't needed; perhaps I 
just thought it wouldn't significantly impact the main functionality, so 
I wasn't in a rush to implement it. Later, I got busy with other things 
and didn't have time to work on it.

Therefore, I think it should be ok for you to submit a patch to the 
upstream.

BTW, I saw a similar implementation in the sophgo code repository [1], 
but it doesn't quite conform to the upstream standard, while your 
approach is better.

Link to: 
https://github.com/sophgo/linux-riscv/blob/sg2042-rel-6.1.31/arch/riscv/boot/dts/sophgo/mango-milkv-pioneer.dts#L12 
[1]

Thanks,

Chen


