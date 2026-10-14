Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010004.outbound.protection.outlook.com [52.103.68.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4F348C4B
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 02:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791945804; cv=fail; b=titsyKMIsm1bBBqdx91aiuSonzNGAsRrLpvf8Cg34q5rgBxJe7y9ucvaf/zSdztfcysXOhAzNAbkWcaET8DTLjsR5FqDiIrSvMxschIbn2L/X9VzR3jkIM9O5ADWQ7KPYAY0lISaPSV2OPWbR2q62Ik8ZlpugI2hgDqya/B83oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791945804; c=relaxed/simple;
	bh=ZQkPCnifYArondPRtAyn8W8NGmaaGqLpaVyUhPjl3CQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tzSYlmExNnwVARm2FEEHfq8jTg4fo5+xvzw/gJJ4E+en75ncy+fqpe2TzeeJLVI+B+wSkUZ+0qosHihlChlqspKQ37n5XCC5Qo2cvmMnclFMD8MTGT1YA22+kOUibGj7AknZiYM7yx4rlJ58TPEDwZKO4vuEOcNh4K+AlJefstI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uzB6eEA1; arc=fail smtp.client-ip=52.103.68.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uzB6eEA1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLz20X0t9AOnuxuwWQMkku54UL18EpwGd5Dy7z/vWVrFays9CMScgbYJL4SzUv1QpkOJluc6xPKARiIIeq0STrbhowmcVVsXC6Uybe2Ek1klxDu+F/+kYo6hUkXiy6IAKBGrugoFyY5BAjZZMD8795ougH0jVxE3tSdeAC2MfAn+peo7hCkFjnRNv0FTAJanrwVy7znyCkgp0/qoInm7pO3YXPn233dW1covPZEZWuxoVScAxYnuQDkr/lObZMx/F/OS2VlRkz822MAfnxIiWJFDqSUKlCXw/MRzPq9BPLz+bgwwfxWOof8dLLh+yU2KCQaAYsuzG+2meE808dedhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQkPCnifYArondPRtAyn8W8NGmaaGqLpaVyUhPjl3CQ=;
 b=hkSjPUbp45XfZJahgZKlnlxkHnpQ4Wm8Akfp5Idqg8oDPa1kHXp3OuK/BnE6PUB18+pkvz7x+xflC8bTf8Y4V6iejssrN/gZakEqBM+wNKJl+VQa0dEGjOhiglza26fjf/WZSqV9vEFC9BGHYvFJiWXL9Y1RQkxQjXURS+MrHmluEpUCoPcZaUDxUI0puQzoK46gsTM/it4CfqTY4QT9aTPCdaOZvXpBbD0tdilfw+Lhdb1Bd1JG/tGR1Y/tkDB9vp3hkFLwGGbVwLDraTSUczv2spWZwdaJO6zvZ59r+p9u7TVB3odPnRLMyLDhJtLeBxMsHH3+ycgWd1lEBfgj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQkPCnifYArondPRtAyn8W8NGmaaGqLpaVyUhPjl3CQ=;
 b=uzB6eEA1mshNSsq9srT100JawdvuDSH6khBl7Fro0H/xqRZUYZEWMqAYeWLpR6feAJg7qarzf/nMNbPK6YQo4l/yjuSr60/F57ewmEqZ6gcgDLwuFQWG8TbQkTZ7iE4MbTa3qyeWJLQZVf/l6wErYTK4eaXtcR8GNCzMp5D8xXQ7Rw+MsOwwboYH21GK1B3PbTr5ih/kk96UIw+zgEGwXQBt+ud61ue9D4QBTTAYbjmX6i1bk6x/vZGBe/o1oltDGLvXmr9Ps75G0muAXV2VOK3MrG5BTKU7Zzq9ccOnNEfmVxp4/wp1Sbdih9H/Log/2DaxonDItSv1dTstpZDNSQ==
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:230::5)
 by MA5P287MB6165.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:233::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 02:43:17 +0000
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73]) by MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 02:43:17 +0000
Message-ID:
 <MA5P287MB6080428F77038F40E008D314FE9D2@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 14 Oct 2026 10:43:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: SG2000 display: DSI host + LT8912B HDMI working on v7.2, intent
 to upstream
To: nick@detello.com, sophgo@lists.linux.dev,
 Inochi Amaoto <inochiama@gmail.com>
Cc: inochiama@outlook.com
References: <cdbe4812564fe417b8a7321e035cc7b3@detello.com>
 <817ee00d07821f32f11fa0fdf961540c@detello.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <817ee00d07821f32f11fa0fdf961540c@detello.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0010.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::19) To MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:230::5)
X-Microsoft-Original-Message-ID:
 <e9e8b9e2-04c9-43a6-9c20-b0d06c5c0b80@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB6080:EE_|MA5P287MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5307c827-d691-4965-0f82-08df299ce6c8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|19110799012|8060799015|25010399006|22091999003|25031999004|24121999003|5072599009|23021999003|6090799003|15080799012|8022599003|24021099003|12091999003|18061999006|10035399007|3071699003|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UCtQdlpWWlJnUjViMlA0dUJxN2VhQWJPUmNqK2xTNVdGQ2tpMGdWTkxzeVhp?=
 =?utf-8?B?VTRmZTJycytyWHBmN2RXVHhTYXljZFdJZ0t0c1VHU1kyRlJ2enpTbWxmM0Ru?=
 =?utf-8?B?VW1RMm1LeHhYcCtjK1BHQ3JUVVJXVGg1M3g2WTdkNFZJc01OVGVzMW5DZXFy?=
 =?utf-8?B?d096cjBYa0sveitVSTJIVzhjQUVIQjFBTnRQbW5pQkQrOWwzY21NY1dndW5a?=
 =?utf-8?B?RVh3NmE3MlJIenQzOXFEVW84ZW9OLzV5SVYzVlhoeENYSzZWRDdwRmViOStB?=
 =?utf-8?B?WEx5bjJIQUxYSFA2MER2MHJBbXdDa3BMaUlGcE9SS0p4RDlyRUo3TUVqR2dF?=
 =?utf-8?B?UjlEaEJqNExHWjVTSzJwR2VUK1I1VmJodi95RG9OSzVwV2hLR1FBVTBmRUsr?=
 =?utf-8?B?dEdzOFNuU2RZMlV2YlhmaE14K3ExOWkzOVdxVXY0T0phbStSVHBITmdicE1D?=
 =?utf-8?B?Tm1tQUx2UmZROUdWME1qbFEyM0s3bEZiS1RXb3ZxQ3JYNWxGV25SaVJhSXdl?=
 =?utf-8?B?K0VwUUpxZVdBYjJ3NmordXpSemRxTDgzYWxxb3hJSHNTaUk2WDNINW9hUnZN?=
 =?utf-8?B?OWJxOEVrZE9CZ1RpYmxSTGgwd2IwVWlOZVh6S0E1ZVFXUy9EWUpxcDJ5QUtp?=
 =?utf-8?B?Z1hUb2NydzVZY2M4SmdTZkhSTm1GQU5kOStKMXlpNS95QTlnOHcxU1VNSjRh?=
 =?utf-8?B?VzY4ZzJXdC90YStlSDFzOUNDTkF1UlZkQXA4WGZvbFpRZnFDbThiamJkRjdX?=
 =?utf-8?B?VG9RWmNGWk1Obi9nUDZDdVdYMFBMaGpFOUU4NnZwaVRkaFNTNjhGWDhOOVBC?=
 =?utf-8?B?ZERCaXdCVzIrYmFoTTE4NzhjRVRBSUFYUnpwOW1PNUljeGpDaU5RK000VGUx?=
 =?utf-8?B?ZzZ6SGprWFdlQk1PMUt2NHNtRDdkZ3JNSTFjcUtTcjh5cUNMaFNzZDNVZVk2?=
 =?utf-8?B?WWRpZE5OMjdISFVKejdLUnQ3b2p2YkhxbzN3Q1BkM3JQRmVYclZmeHg3NklJ?=
 =?utf-8?B?NmpubVJkYzduNmJzdkV6K3VPLzNoZ0g0a2FUYW1sM0dYSTFyb1l5dFpudkNI?=
 =?utf-8?B?OXFjVmhXRFNJcExld2I1UUVBNmxaOFljc0ZvSWxDZVhONm9OZlF6bDM2OEJI?=
 =?utf-8?B?c0NFYTVpd0hMU2ptNGVGVSttZk4wK0taNzlhTzZBcnN5VHdYZGJTYmNmR3N5?=
 =?utf-8?B?WGdWaGZHK0NvOXBRRVBiSHloS2IyQUl1RGpYejZ4TTVQZVhMc0hzbDU2SVhz?=
 =?utf-8?B?cktyVlpZSFBSZUVMYVl0ZTNoZFdGczREZ01pZlZqdzJxdno3T3pnMHptL2pE?=
 =?utf-8?B?YnJlbmlkMmxFSmNpY1JraFc1ODI0aWJWNWRPWHFyYmlXMSsxVzE2bm9WeUF5?=
 =?utf-8?B?RUZHUDZxV3RKTmEwaHdJKzVEc0hvbC9yb1RoZEMrelM4bVlpS2lTc1N1bmQ0?=
 =?utf-8?B?TXFBZytlV3ZjS1d6N3RDZS84bStIa2U1ZzM5MkR2YlRnaTlrNGJ2TnhVN0RL?=
 =?utf-8?Q?9SBnEMKx7x100SNMkjSJcCid6QK?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q08zazF1MlE0SzVNNkZXU2JKRGw5REVOenlkNnpYQndob05RQ3JIaGcxMHkv?=
 =?utf-8?B?U1J1cTdocUJYMXlXSlNMMFdCWE9VaDVUN3B3K0ZTbVlsNEJJTU13bDVEek55?=
 =?utf-8?B?MGFEd0VScXNIVDEwL0dIZjREMVhnOWtQTG9rdE5CT0ZzNHZ3L1g5cHk4WTJn?=
 =?utf-8?B?UWJJQXVCNVdIdW1XdHBuSXE1TElzbXVWZlp0dUhuaEtycW90cFJFMkw5aEh3?=
 =?utf-8?B?YkJ4MmVQSG1ja1dXaWFlcXZFTEE5Q25hQkxrY0pEWHNjQmZrNTYwTjBseTBP?=
 =?utf-8?B?aTZWQkhZT1I0UUNIZWlrc1QxQUtDUjdMOE45eWNFNnRRU1FGNjNHWDZTczVh?=
 =?utf-8?B?U0NSS2w0ald5c1cwbFhYVlM0SkN4bUhzdmhzVGFvd1YrWks0NlEwOGRuckhZ?=
 =?utf-8?B?T0RKNUw1SmEyL1BTNjJYQUlsTC9kd2svUVpzeU9hZ0lMM0pHL1JRT0pVazkv?=
 =?utf-8?B?ZFZqYVppNFB1czJJT3IxdHR6dnJCZkJUTTVKbmdVZ0R0QVpVNmNZdjVLL0pa?=
 =?utf-8?B?R3JKbWJ0VmQyNFBWZC95bVdJbzdHSjQzYmpsVEdFMGNvQitoQ052N0EyYTJU?=
 =?utf-8?B?V0FjN0FmODFQVW5xdXBTRWxLcEhDTHpINXFCT3MvRHE4dVRHZFBrcmZ0eDhG?=
 =?utf-8?B?aS9pc1oreFB0S1QxNFRvN3BZbXgySXlWQyt6cGVCdTJnbGpxVGpEMHNMZVRn?=
 =?utf-8?B?cldwTUJvb21JRHAxai9GZTFJVE5MNkxlNkt5NGwyVUNlTVV3NlNGejNSdDcx?=
 =?utf-8?B?UnJrNFhrT2pISjFoTUwzN0QxMWlTTXRpbUpMSDAreGZaa0RqY1JSUW5zSkd4?=
 =?utf-8?B?SFlXNFYrK2g2TTh1TTM3NStoRkVab2NrSVIvQXRJdldoQjdjVFltM0ZRMG80?=
 =?utf-8?B?dEx6a0hkdTBMNlVIV2k3eEtqeEczeWgzQ25nOEJyeGY5d2VFTlpjWFhHOGQ0?=
 =?utf-8?B?Y1hTRGxtbGhnbW9TWmpETExBYzJDbXd4Um8zaXlldnU1KytGSUdIbVdLZ2lC?=
 =?utf-8?B?UnNZNjZiUEtYUUJNS2lXSzBORVZCNGM0bXYxdms3b0YyRjdwUDlJTUt4Umd1?=
 =?utf-8?B?MUFrODYwdWZlTmhDcENOK2o1NE9SOEc4MlJEUmNCeEQ3WDZaOUlSSzNCaGhW?=
 =?utf-8?B?TkVpVUdRQmpnaUVsMEw5UllkajdjVWdPNTJ3Mm1XcTdxUm1qeEtBQy9pV0l1?=
 =?utf-8?B?dGpscm5RUUQxN1BJeGsrRlVYQjV6REY1ejE5RkZybDl4aUc3NmloZjRwOW4w?=
 =?utf-8?B?NXg0UnJWS3hhYmJLWjZ6a0svNVlJR0hMTWJCcWhLaUdiVlYzNG9jOW1ZNy9w?=
 =?utf-8?B?QlhqMjA1RkdIUk12eFpBalZSd3cwRXIxY09GRnF1Y3o1R0pkQ2F2MGdSTVk5?=
 =?utf-8?B?cmsrVm05OXM2WWFpNTU0aGhHYS90d2JTWEx0NWhXREJrSnByTDhVT3VDRmlm?=
 =?utf-8?B?TEFjQm5jdmJhSk5YSUtYWDludUMySlpGd1kxTS9EMHZjMU9wcWFoR1JMVTlF?=
 =?utf-8?B?QllqamszU1p0RUdZdlBKblFrUWI5Z2dsQkg4MVdqNURXZ0duRVNkajFGbXd6?=
 =?utf-8?B?bHlHbDNzaTVPL1FRUjBDSUNidzREK00yNi9BTnBkUS9aajJ4MkFYUDM5bVlQ?=
 =?utf-8?B?SW5JaUc2VWNERk5TV0ZLck4vbmpYc3BEdFNQM2xHNWowS2h1SHFWMUFUME0x?=
 =?utf-8?B?TWo2ZVdReVlVRXlKKzJiSW4vdCsxbGc2bG5yWTk0aXJXT1VucDByd3Y4SGY0?=
 =?utf-8?B?WGpRMEE2dkFFajc4ZTNNV2tCcXB5RGR0TzNnQmFlUUlXekxjUDl3eEFtbk8x?=
 =?utf-8?B?dEVJU1ByZ0hPMTBHRUM4REFiUmhBbVhSV1dUR0tJUGZqREE2aWZmYlp0YTNY?=
 =?utf-8?B?UkU0a1hucnVaRTB0NVBLUzYzaUtScDlHSjJxeXJsbVBaR1c3MmZkY2lKQ3Zt?=
 =?utf-8?Q?lG0OYi9rsM/qaQyyhDB36Q3466js/JMG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5307c827-d691-4965-0f82-08df299ce6c8
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:43:17.6663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB6165

Adding inochi's gmail address, which is the email address he currently uses.

Inochi, could you please help reply Nick on this?

Thanks,

Chen

On 10/13/2026 8:49 PM, nick@detello.com wrote:
> (Resent in plain text; the list rejected the HTML copy.)
>
> On 2026-10-13 02:24, nick@detello.com wrote:
>> Hi Chen, Inochi,
>>
>> I have the SG2000 display path working on v7.2 with two small kernel
>> patches: DISP, DSI MAC and D-PHY driven by a new DRM host driver,
>> through the in-tree lontium-lt8912b bridge, to HDMI at 1280x720@60
>> over
>> two lanes. It's tested on both cores (RISC-V and ARM) on the Nix Badge
>> 2.0,
>> a custom board around the Milk-V Duo S module: console on HDMI and a
>> 15 fps framebuffer animation.
>>
>> Two questions before I prepare the submission:
>>
>> 1. Is either of you, or anyone you know of, working on the VO/DSI
>> block
>>    for cv18xx/SG2000? I would rather join than duplicate.
>> 2. Any preference on where the host driver lives
>>    (drivers/gpu/drm/sophgo/?) and on compatibles before I write the
>>    bindings? The branch uses sophgo,sg2000-dsi and a
>>    sophgo,sg2000-vip-sys syscon, and adds one clock ID
>>    (CLK_DSI_SYNTH_SRC) to the cv1800 binding header.
>>
>> Code, as one reviewable PR against the board's NixOS repo:
>>   https://github.com/NixVegas/BadgeOS/pull/8
>>   Driver:  pkgs/video/sophgo-dsi/src/sophgo-dsi.c (~1,500 lines,
>>            register provenance from sophgo/osdrv cited in place)
>>   Patches: pkgs/kernel/patches/ (clk-cv18xx: poll DISPPLL's real lock
>>            bit and expose the DSI source gate; lt8912b: do the bridge
>>            setup in pre_enable, between the host's LP-11 and HS)
>>   DT:      pkgs/firmware/dts/sg2000-milkv-duo-s-common.dtsi
>>
>> Planned order: the clk fix; display nodes for sg2000.dtsi and for the
>> Duo S DTS Joshua Milas's series added in July; the DSI host as an RFC
>> to dri-devel; then the lt8912b change, which as written is specific to
>> this host (fixed HDMI mode, LVDS and PM paths dropped) and will be
>> rebased on Maxime's atomic-callback conversion on drm-misc-next before
>> it goes anywhere. Known gaps before the RFC: fixed mode (no EDID, no
>> hot-plug; HPD goes to the bridge on this board), no vblank interrupt,
>> and register sequences reproduced from the vendor driver rather than
>> modelled.
>>
>> Happy to share a video, serial logs or register traces. The driver was
>> developed with Claude Code assistance; I have read and tested every
>> line and will carry the review.
>>
>> Thanks,
>> Nick DeTello
