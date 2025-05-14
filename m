Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8861DEFFE
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 03:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747194037; cv=fail; b=KBTIgdvF09JMW2NUYtaR9pTJkNFHVVsBmi3auhVjhHV/3f2nbUyCIdvWJS/ZNWV/C7+Adnspf9KIErrBdl23GGiag32KtS0wuRoVGN26u+aKL1HHOgMsGFgTHcdv3o4tuxKJhBTM5KZEi3vyYTAI8ohbTToMTQBiaD9Zill9Dj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747194037; c=relaxed/simple;
	bh=UCmUfdPQpL6ienBS505ECusT/XAotPH7yJsYjABcUbI=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=OFo++4AtdkOVAcJ2MVep7yOPwgv/sFspYj4csTiT5tPDnm5RZALdsn3wq441MEQVSP1DchvGFARpTYZp2TCuBiZNZ05MeI+w1vbTXafTvi7K01fd1JW3qljlE2K7NjZfGeNMN2cOZmuPadrVZZqZtXzNJLNTqlcTBy7wblZxVYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u0rY4h2g; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u0rY4h2g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFx2VO7OEuYjwhQRlrDv0I+DgjtBAMWDuVw/KUldoLFF4vCtsDRBWbLiKOsfeQWvH1drUFk/XtuQp/ZQ3yxcChQhvzF08niubo7StZr80KIPU2/fwPn2tSYsrM9VaGZpHK9QX1Myvq0cL2Q817GcH5ZYX73Z9nzUAKCZ+vFUze3Ky7KBN8hYV3des/s+Lf/6syo0aSY4TmVsKYQhpRI3/1BPLVu4emySgFzhmx9n1ElcKmzu8dVazyBWyQ3e60yJE8bOSSDR0xooqD4JcecxF5N82eDjx4ZZE/rKLUrjwLp4J20vSU8lRYIv6tnu9jxfCdkvbGUEkDA1f7baIzvLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwd1T/b5BFL2IGe1X1CKgrtzA9EMp4mZKXqrI660aXw=;
 b=eh0TIZCZIudsJmrsKuu0Vb07l50PYn3NjP9Gti6NmD3EolRzHfxukfd+qTcQcWu1OqUXHcM4HttHmMwfCs4g+KJ9NJo6l2HWlnkzj/kp/CIM8Ip3gDrfyIfUCSw7fGgU+DrhmFknGUfJPqqAjytuqfhhmSh2Pe9f5ZnyAB81U8llrAUzU4r+juTd+Njwrjrn6IL5KgReoFxWFKGKGIU/OKY9iO8Uq0Gg105+4PChRHuLHTHwvuMmMrlMa/fAPm/FrCGaHyo0U3Dfug49kJmib6ALkqTVZhuZQe62l9R5TCszyBBZHGGhUgeoNfI7x1YH2yeqNVQb8T3mA98j+8bs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwd1T/b5BFL2IGe1X1CKgrtzA9EMp4mZKXqrI660aXw=;
 b=u0rY4h2gDhBQpkEVG+eknZXyReDh7yrWnUMKuS1zLQUGeZsYDnWqg15THrMOdVomuV9UNO9CJ+TTtXV3maT2wckxGXQX7STbadaknJG8w9xHIIZi/qE+bPCUw9osUp8vxkTK7NhqgcDJR2ODy6pTAI2Rsj0uMXqUhqcvST56KZ6HvSQPevod0ERDot1KyEb+nEDmdazOLCne6kx/g4NagWilJlvsbNgsnoXVjASFDKNYAyKKOPZwLZAyzJRsQtRx8hxbEc9NewIn6BGseVEUWH+0Tc5cW/Etj3drOCg4AeN9LSMILOoiU6bCEPNwZ6j5LtZFgxH8SsLvMOO3ug4+NQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1851.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:104::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 03:40:30 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 03:40:30 +0000
Message-ID:
 <MA0P287MB2262B041A26A0F5EAD1E296CFE91A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 14 May 2025 11:40:23 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
 linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo SoC for v6.16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <aec83d6b-f90c-44b1-b40f-ff6bc135990d@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1851:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c4d3cc-445e-4a2d-ba60-08dd929912ad
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TV79KLUZXH6jYsApOyagGvSed5QCgDSBBE3xl1RPQqN7OHEqtTTTVai9uuA+4gwiykhcIH9UFeHWn0s/TaUMe4us9KOnEY8Vzya9Cjks3PMEK6KgESekTJPEIOtFi/z+wog5+Nm1GN0BsYFGm6dViWhAyKCAZgZi2CzkvdJfjeUbd2hSZoL6ey+Ww0U3m1/LrTizip/f8yPHmGc75T+cKCAA7Ki8uk+FxiubAA+RLJYNiULzfg6GOgkjx2VGuLwU9DrLyj9QYfBnG/bjyRPD2aXKYz3jQAhWJLpRzmGaEJNGFsbLdM/EbLdPVxHpaDGy//9wYPDaaz4AB0lJF1/QSlRFe5UOikeZdurqkIHaGWvgAFZzuJyFA4LFfbpZGuRBpykHlHRqbd67XwW1M+BiuefYkn0MvW8TIeEdv+WtE0lGnVwXv8iGAuDJWsPENHlO6ksWsWRW3o5haHy2NmvSR4H5D2Lp+finTjKpoFXZSLGBLWGSqTFfg1rhJBkN4YlU0fMk+8kZrV/WK6egUohC8+9t9mosllQjNbTyH0t7eNzJym82kXbQxL37I8H6Ipm628HIGLzfKyzXxHNys6IYVXPArIJOQEdUKhqVUCGAJd6bpPeTJYALp3SSVEYNp0sgl4nEoMZnEOU4yufVjhZjjw06h4vEwRhiXLXVuja9MhTFkajpr7+2Ygk7Z+U7kqHxQcRJBoXyrJvbaAwswKdHl1+Wxr8gR/iOGbDTal9ZILni5qLaObkPUZnhFptYgodi6+YDtR4TCA1+CFCdicmNoGi2FWyTQJMHBI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5062599005|461199028|5072599009|41001999006|15080799009|19110799006|7092599006|8060799009|440099028|3412199025|10035399007|34005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUszK3p3TjF6TkhIWmhLZFh2c0xCaHd4MDVUeCtRM3htaHRYdE9teTNDUWp2?=
 =?utf-8?B?cXB5SXZSMTNReGVHcW1UQXJyUUxVdTFTTGlWYnJ1SkRqOHorVmUrLy9LWWU1?=
 =?utf-8?B?Q2JQUFlTUDlDOWYzbGlxZ3lPdVA5ZDZXRmxTbzdHMTVTRnN6NkFWUExLc1ZZ?=
 =?utf-8?B?SEpwNEoycy9UTXM2SkNlaVN0YW8xcHYwNHFFNEhOUVlOK3gwSFlKTG96WUVZ?=
 =?utf-8?B?UFl5algxUk9aekViQjFTOFZsUkNtRXVKcmlyeDZoUS9KV1ZST01yTmlYazcz?=
 =?utf-8?B?WWFCWHRNenpaSWNPbGp4TkEvTzd1ajBBdVVjNkx5dHc1SjR1WGpha1JEVVox?=
 =?utf-8?B?OTJIQkFyVlM2d2VqSFB3cUl0UkxVdWd1L0lmdDFranljZ0l3Z01YWTJWRnRy?=
 =?utf-8?B?Q0ltYmhPbHBCMzVRdC9mdDJLR1I1Vlp6SlIvdTN0MEp2SVhDVXdmb0FkbTdS?=
 =?utf-8?B?ZUplRlphOE9zNTRtd1hBQ3A1cGFTSzRxc1Zwd0dMTEt2cU9ndy9Edm5BeGk1?=
 =?utf-8?B?TThVU2ozNVJLbWJTMDkxZ1ZSWXdBMUdhNHo0SDV6ZDVwQndoR1RESitIbUo2?=
 =?utf-8?B?bTVBS2hlcGlOUzkyYmY3TmFSN0NuVk1XK1pERkdkeEdYUVI1OUhkZHFVazlR?=
 =?utf-8?B?RWtVakhySE0xSmJsSWVYcENvS2ZscHlmRUtiSFdFdkNyMS9GTkxqSnpjK2Zl?=
 =?utf-8?B?VVV0MUcrd2UzZUdBOGVHZzloTU05U1NFblRKWE5GdEw2ZHlqZUlDdmhuZlB0?=
 =?utf-8?B?TENpdnJrWGY5THhqZFdURVl1QkhSTC9ZMFJzR2RmM1BHZE9EKzliNTRMaEZp?=
 =?utf-8?B?dEcwRW0wQXZ3Z05oWFNIaXQxZEpOY1k3aU0wU1lVekNzMUJBUnpDOW5qeEVS?=
 =?utf-8?B?bVRQNGQ3SXBIWEFaU1B4U09TaHA2TFExM2NEYXNUcmdocFNKVXBFM1dYdWhK?=
 =?utf-8?B?b1p1RGU4N1F0dXpubzJGNGtmR1YvYXpGeFJ1ZXZ6QVNoNTVTZjFNWlBKNzRh?=
 =?utf-8?B?RjQzMU9zMHBhdlgzcFVMRDNCamlXZVpRRVh5TlVkcnNDRnhieS9JN3hCV3hC?=
 =?utf-8?B?cjB5bHNtbmZqRnZVNzY0Y1Z3UXU2U3JtK3R4TGVvMzJEck5ZQ3VYcWZWMy92?=
 =?utf-8?B?K1IxLzB0bGN4VjBZSDRzMHZ6bWlSek8vanNPcHF5K1BwQ1ZHTFpnelV4UzdC?=
 =?utf-8?B?RDNzdXZZa2RxNHRqdzhPRkNQNUJkK3RhVzVyOWY2VDZzc0RQQzdnakwvNDNz?=
 =?utf-8?B?MFdYVU5kTmE2ekl0eURMZnFNMEliTmgxaVVKb1poUjQvU2t1MmNnUVF2czQ2?=
 =?utf-8?B?aXVyTHcxZzMza0x3NXNudmsrNXZBVGhQQVk5Z1hEQVMrYzhadHJkNlpZbS9H?=
 =?utf-8?B?VmhuZFEzZDYyYzZNN0RGOFFLTXlzUFpiZ1hNUEplV3JaRGRkUkJkYjdCSDZU?=
 =?utf-8?B?RkJEL2xLS2Y4cGQ5QWxEMkFpcUs0UThDKzNqZmFJOFJrelpzSFQvdlJCVlBo?=
 =?utf-8?B?S2tGYUdWUzhKRTNGdUhMSlRIek9RRmVjNTZDYTlrOWJJcUkxUkZub3VWTkt1?=
 =?utf-8?B?OFd2c0psUFRDZm1Ca0JhRnoxMjl3cmRWNUZQcmwycEdOemhkMTJpRjEreFFs?=
 =?utf-8?B?T3lxY1k3QjRRcVFGaDNzWTFGNVJ4U3phbm8vNGRKdzNzb3BTRTJsdnVBMmJt?=
 =?utf-8?B?bS9STnR0QkExMTNOMzZQbk1ZL0ZoanZraTdPTlhKOXFFRG9TZS9wZU93PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWZXK3VkTUd0ZFpEYnpGYk5SM0JjaVBDOGNPYitSRDFSMFhvaDJDbFRMK2lL?=
 =?utf-8?B?UnRiT3FiMlZnQmlpeVcySEVieHExZ0poZEViRHVSZXRObnJoUVVMRkVrY1d6?=
 =?utf-8?B?OUhXeWZoRWg5ejNqSUpFNUZOdXJBWHBpelhQQU0xVW4za0hXWkxBUFlwVDU1?=
 =?utf-8?B?MFZKbFMyaUEzM1gzTXAxa1k0bkxkY1JDU0dDV1ZHVFNuOFd6bWJkdGhFbU9J?=
 =?utf-8?B?YVNtazAwQWtnVmJLU0lXbjRkUkVwVUMyV1laUFNxWjVybEhKS2Zwc3lLWGV0?=
 =?utf-8?B?bUo3ZWdGczJDVlgyVHl6U1J6RXU0UjZmcUxKYkNpbWRPbnU5MHh0WHUxMjNH?=
 =?utf-8?B?c25YWUlnd0k5RzZiemoycFNMdWdxM2VZSzJxOGVJYWExOUFOVitHYkN2Y29I?=
 =?utf-8?B?a1IvdFBpdmpZY3hHTUJzTjRSalc2aC9kdHhIa1NLSEFMQTZaSEdGYkVjLzBu?=
 =?utf-8?B?Ui92My9nUEk1dDk1TzRiVEUvZkhVekFac1QvU2wrb29zOWw2QlIzcEh0V0dn?=
 =?utf-8?B?TzFsc0hlejZMZ2JnWUNIa2tNc21icFR5ZVpiSm9TM1N2b0EyaFk3dFdtMlNn?=
 =?utf-8?B?clYyaWUzTUMxNkdYV0phVVZNamZ0dW5SdEFyUy9FbDdCZk90ZFhUNFRRSGQz?=
 =?utf-8?B?Z3M5MHZiKzVnQ3o5ZFQzU2lkd3BSRHpybFFzWm1ibjRWcEtIYVFoV2xPZVNB?=
 =?utf-8?B?RkdCblo5ZGtLbU5jbnpCVWpad0owR1Vuc0tnQVB5eWdnU0RVbmhxalExZ29i?=
 =?utf-8?B?SWRoVlBwVVZ4dFMwbU9hNlJTZVVPcG8wUjhpTWRJRFY3TktPNjBOekxnT295?=
 =?utf-8?B?Q3ZKS2J2eEMzY2U1azhuRS9PYU5Pek4vTllIK0RLTlFNVlRHUmsxTUdsWk80?=
 =?utf-8?B?N3RJOG15UE5kT3gxcFY5NExzL0pkRFpoZjRvOGowZ1BvZVJaTFhRaHZoT0Nt?=
 =?utf-8?B?OGVjRFBSbWVYZ2J4T0Z3ZGU0bWRVQ0VpVE9COWRkenRQMGZRSmNYUExpUnhY?=
 =?utf-8?B?MzA4ek54MnR2V3RqdDh3dE40bkhIa0RHMHVJTksrZXJLQ3RVeGNadTlrZUxn?=
 =?utf-8?B?MVQ5SUVCWTBjdDZCS1dSSWVINTFCQWF6STNWcG05OTRENFhXMkVwR3loaEh3?=
 =?utf-8?B?RUR1Rk1GWlZ1cUhhU3Y5Z0JhOVljSHRUN08xRkRhNmFnR2gxOGVXRXRyUkNq?=
 =?utf-8?B?WTlvZkdEaDZRK3o5SE5NMkVFeWtXcWxMeTl2TWRUQm1wOVFmUDhwUlhKVk1a?=
 =?utf-8?B?Rkw4QUR1TGx0NUJDSmRiMkQzZHJUYlVCcXk3a2ZmTnhFcE9YY05jUzBldjBE?=
 =?utf-8?B?bUJNVzN2K3FLOEhNVGtVdkh2blplczF4Y2NTdktISU8vZW9RQ0lIQ21hSHMv?=
 =?utf-8?B?U0Z0blUzcXJtSWtQQmNYZ1pvK1BGQk5ER2V0aWQ0NkJDcU9vNndBOVFzMW44?=
 =?utf-8?B?ajZVQXhZYzgxSE44cGlrSUNNRFVxUWFtaWxFOGJUbTk1TXQ5ZEFYNXg4S3JW?=
 =?utf-8?B?TkFTZVhKME1xWTFBVjdmZkZlSGpxWHlsSTJWTVBsTUJQQVJSaStsSlF2MURp?=
 =?utf-8?B?SFpVQk5QZkUyaGcvcG4xUGRPV3pPcjVXTkJBOVNkTVZQMzBkMVhLd0w3TERa?=
 =?utf-8?B?WVVhNmd3L1htUWQ4QTJYRUtVV3FNOU9VdHhkWllVbTdoRmtLMDRIQzhhbjA2?=
 =?utf-8?B?NTY4Rm92T0FnUmorcnlzNjhzVGJHbHIzUjRUVXZUL1UvTExZVWVmaDZhekpG?=
 =?utf-8?Q?lynSrf3ix5oD1p6up226X2RjYJSpIhndz57al2u?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c4d3cc-445e-4a2d-ba60-08dd929912ad
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 03:40:30.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1851

Hey Arnd,

Please pull soc changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-soc-for-v6.16

for you to fetch changes up to c8754c7deab4cbfa947fa2d656cbaf83771828ef:

   soc: sophgo: cv1800: rtcsys: New driver (handling RTC only) 
(2025-05-07 08:40:02 +0800)

----------------------------------------------------------------
RISC-V SoC for v6.16

Sophgo:

Add support for SG2044 TOP syscon device. The SG2044 TOP
device provide PLL clock function in its area.

Add RTC support for CV1800 series SoC. The device
is called RTC, but contains control registers of other
HW blocks in its address space, most notably of
Power-on-Reset (PoR) module, DW8051 IP (MCU core),
accompanying SRAM, hence putting it in SoC subsystem.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Alexander Sverdlin (1):
       soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)

Inochi Amaoto (1):
       soc: sophgo: sg2044: Add support for SG2044 TOP syscon device

Jingbao Qiu (1):
       dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series

  .../bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml    | 86 
++++++++++++++++++++++
  drivers/soc/Kconfig                                |  1 +
  drivers/soc/Makefile                               |  1 +
  drivers/soc/sophgo/Kconfig                         | 34 +++++++++
  drivers/soc/sophgo/Makefile                        |  4 +
  drivers/soc/sophgo/cv1800-rtcsys.c                 | 63 ++++++++++++++++
  drivers/soc/sophgo/sg2044-topsys.c                 | 45 +++++++++++
  7 files changed, 234 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
  create mode 100644 drivers/soc/sophgo/Kconfig
  create mode 100644 drivers/soc/sophgo/Makefile
  create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
  create mode 100644 drivers/soc/sophgo/sg2044-topsys.c

