Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011027.outbound.protection.outlook.com [52.103.67.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D43230BF2
	for <sophgo@lists.linux.dev>; Thu, 19 Jun 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319700; cv=fail; b=l/E34UwNRjzdWffIceY2egF/5YIwuzjM8YgfRH63jFYJ3bvS7rML2vDb5sBiIUMfdgLjE3xWked4UCTXRWcOBGZ0c1PDs2Q9Ix261QlY1vQQkgY3gqRVnHSRiqdkBVBYzUhpP+2RT+MmvHpyWWkNSZxB4Tr1CdxxHrxJoBIn+R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319700; c=relaxed/simple;
	bh=kpXNqkupribJH2KfKjHhEBoBIQ6HJ+JYc/YVjdkDcqI=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=CLMCDmKZlZUusWrQApAUriYq1nNvI5lwXAf29Zj7thKctsZz3EVRz+JYcqlBq0qj8A4oEMF4UDsDKENufmcNDnUCbBd1N4LApgxVC3YcFVLKZb3bMiEqSR9iJuEDzfR/GNsYk37MFsXH2q4d7E7sH4vFB/1TDo9xn4Ubha94TEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BMwfZHkK; arc=fail smtp.client-ip=52.103.67.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BMwfZHkK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B43UPpYrHHUxaMZPUFm8PiQfVhJHgB3drJZKMnuynZNP32orVRiCiVybQu9Up1fzqrRiXZM46/ZA9QzvPnUpfjepjYMHUezvZgrHkg9JK6brJFbuX3Qof7nSBj0qDaZhui9/8Z4ZHmszIcP5iGaHDouVa1giAN3publhlA+WACtE+QumITTqU+uIEETNVfkInW683jiUDkWcNoXWXW4QjAvcmYYDDkxiB8WFcVDWQDRGVoye/8XlN7DjLjTwLqd0LWo5wQe8r8y/hS1RzvnxCXToxtd+6eFVyLaQ7FY/ZPnrvErMOB/hFjY01eRz70AW0gR0lsJZswEep6aq6Fjljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Y0IcpB5xTSdxiSBnA/4yp6HP15VZZstBpcpJqpGx4=;
 b=rO3K6ax+i1MuMUbJ6c8SLNUaILeDacNu1hXy/wjQLVCyOeP8MBcBgGg/SmEUuPBlp51qXrl1eQ2Zp3BE/LfFjFaCY2DSJfoLMHCeJd/rGjXQAnl2DRVkY4vMy2jvg5F6pnvhfiosNJ7CE5u6S/9BGSyaHXqQEdolhznekusqOqaUMEh6nWwuA8TBedCKUv8GNa3qncdYTaqYkEWIiOMzFrAd2d5dKFLHrfp/KVeKnio22VilwmEh3/h096iOwxj7ud9RwQHJCFTqoPDfrwMI5CHg56VW7EEAKpLtLQm6UUDHZj/LVcf4ZECnjyIrFrOqTe2YxQp3LWaBAgYS+RXfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+Y0IcpB5xTSdxiSBnA/4yp6HP15VZZstBpcpJqpGx4=;
 b=BMwfZHkKcQPGmbkNXcUth0KD9u4dQ3n+DrYRmX3kqx44WuaQim0PY4zLxfex0BvQCEv0eq8x8o71CFYoNd9Qw/QetbyTDU6tie7hOycNgkiAqiwNiSfKDIUKy0GEShs8eLgMeXWjZ2EnKHHl2OXW/+N3Y4ax9Ggobj0lw/ERIWx/sAssCI+b3Dye2FozKOEk0kW9D3byLsYYzrsxra4vB4oPDfU5eL9FcosXNSoeFuVDjz0IwPwgWzGNK1xtdZYmHP59YNPz5MDGFmTSeK6RR9W497MfeQr7Na0Gww+9uSjoskum7VnNMEb+q3mmOabjn4jid9EdH1oviG33T6jhpA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0175.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 07:54:54 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 07:54:54 +0000
Message-ID:
 <MA0P287MB2262826AF772B598BF98B51BFE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 19 Jun 2025 15:54:52 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/11/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::7) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <054dd696-29c8-41e6-977a-fb2feefa4f36@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0175:EE_
X-MS-Office365-Filtering-Correlation-Id: b4793c07-2b6d-4b42-816e-08ddaf0693e7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22402599018|5072599009|6090799003|15080799009|461199028|19110799006|8060799009|7092599006|1602099012|3412199025|13041999003|4302099013|40105399003|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1RFaEdzMzczYlQ4UWdoeHowWTZQNTRoYUhZL2RNak53TE15NTZNMEJKYng4?=
 =?utf-8?B?Z2F2NzU2eGgwNDVES0U5eHhtaXBvNjFnWUpJa01XN3luYUFiTjRhcUJFU0F6?=
 =?utf-8?B?ajFKSzltRkEvRDltOGNoa1lZYWlnMmxLM2o3cDFybytaWTNIOEkreEQ3N3lL?=
 =?utf-8?B?M1hiN1lEaUtBQzY3bkgzQmVQcVhrVTNxTjNFVW5lN1pHOVJIbHRTSkthZGRm?=
 =?utf-8?B?MDJsdmdCZXRleWVLT2I0Nmk0S3lKbXpYcHVOR2piditKemN3M2VzUjhBSGMx?=
 =?utf-8?B?SkpOakIyMTlYRHg5QjdkTDdIR3RLdFRJeXRudEtwZkh1MlVQOUx3R0hlMUtn?=
 =?utf-8?B?bnoxNE5QQWY4NkNyMzJxeUo3T05RYk9pSWtsMzM5VmVldnI5Y0F3RUtXWHk5?=
 =?utf-8?B?cEYvUTFFMFdsdlRpWHRRQW5MUGFNZTBSNmJkdkIvbVZLT2U0eDlqRkdrQUVs?=
 =?utf-8?B?VGVmMk1McWMvdWtNQ2RuTnZZcFNoMmF2eWVQaW8rTU5WZlZUQmwySG5STzN4?=
 =?utf-8?B?YmtVaG1WSHNNQVNTeGxtSkkzTW05OVhFSk5JS3RzazVlYkN5VEplYUU3Zlpv?=
 =?utf-8?B?eEd4WjVwWkxYb3FiOGNvQWUwWjBJVG1JTTlzZEM2WktSUnBYL2R6Ky9jcCtU?=
 =?utf-8?B?VWx6T25xbGFTOER0ZDB6cUVoNEtIVnJYdTZJQzRrNEt4NzRSTkt6UkdXZnBK?=
 =?utf-8?B?K0hrcExjOUZZdGpSN3FsUjJ4bGJOdnUyY0VNYnBqTkVIUVJGdjFJR0pJcnZK?=
 =?utf-8?B?aWlNd1BuRnJkcVJlQTk1UVVUSkx3cVNSODFxRVRRMmRnTTJacGVVL3o0bU5J?=
 =?utf-8?B?YTdlTkdBZFovRzNnQkFiYUswc2lNOEY1YnpzYVNFRE5qSTIyRDREQUM1dEZU?=
 =?utf-8?B?NHl1Z1R2Y0hIYXZvcC9hTmNSemFXZ3V3VmM2WEcyZUJ5VmIza1RCL0J3Y0dD?=
 =?utf-8?B?ZUszSlEzRGRZVzd6R0h2TlhmcFBZNEp0dVN0QnJIQ3pwVHMwa05nT2NWMksr?=
 =?utf-8?B?SlkxVGVGdlNLNE4yelpRQnQvcmxFTlY2NUczNXVzYmdWeGhBcU4yQXFZd3A3?=
 =?utf-8?B?TU9FOTZEQWZ3ZVdqNXd1V2tqMGZGZU9pbmpPNGh1dHMva3NvdjN1ZnovdURU?=
 =?utf-8?B?ZkM2b0NXbjIrbHIyRnRRS3dmVVdNR0luM0xHbENBbFJyemNIemRxZU9HZkZa?=
 =?utf-8?B?RzZBWUQrNEJxVitESkN2Z0JKcjBGWEpEekd5TncrVE9oTHp5OE9UaVhndW93?=
 =?utf-8?B?RCtNdUFpTUdGazdnMjJMN1VuL0dsa1B6OEpNRmQ1aWQxMkJLa3RjT292NmdP?=
 =?utf-8?B?NC9NVlNnK09GYWpSUHpGQkFEZW51ZnRjREI3dE13VzZLUEhiRDhUMTVreHNQ?=
 =?utf-8?B?c3U1MFNlcDR6K0h6VFc3cUJGbEV1azc5Y2RiU3VxMStOaTd3ZHI1RWtwb2J3?=
 =?utf-8?B?VkgxT0tYdkRCWGtMNTFscHprSkMrZ21Ha084WlNSaVQ5ZDhYTHZ6bWllK200?=
 =?utf-8?B?MEx3TTFodXhueE5QejNUc29adGxFaThEanU5Y3RxVmk1a1V2TmYraG40S3Iw?=
 =?utf-8?B?OXNmNDVGSm1uaDN4QU1ZRU5RQjdJZGVaM21UWjdBUXZQODlDWjBhdzdsSnVJ?=
 =?utf-8?B?Q3cxQnZ1NDBiM1VhOE5rU2R5ZjAyUjZmb3JlL1NiNkhUSTg2YUJ4S290YUFH?=
 =?utf-8?B?NlE5UU5YdWhjZDg3TTdrblN0YmovRHVldTUrVjVvVURCS05BQXczQ3BXeVpF?=
 =?utf-8?B?M041UVcyYzFad1J2VTVaYlhPK2VDRTAyM0JGWmZSL2ZwMWVReHJrdmVVUFBu?=
 =?utf-8?B?RHc5M3p0UVlyekcvOVhBNEU4WlhacUg4dUFJdDB0cWJUSHZNaGNyWlVXYXhE?=
 =?utf-8?Q?v8K2gSzuJeDv/?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEJuWlJ4T3h2eWRJNnhBMlB0VmNRdFhyTGc2NXh6emsyYTRsQXNCMllvdk5v?=
 =?utf-8?B?dVdCRTd5bUJEUEZjT0RPYnZETmRhckZJdlRmQjdMMDkwU0diRDNUQ0N1VEhS?=
 =?utf-8?B?VGpXWXJRQ0Vyb1pJUVk3KzA4Ym9PNzg2MXZ1SExxMUplWUxPS0ovS1hYUDVn?=
 =?utf-8?B?ZFBGd1hucmVRb2lkZmliYXNJSENPMm0xQWlOeXp3eHRRT0FSeVcwTGVUSWdo?=
 =?utf-8?B?aVNNaUFlcnB4bGVwOTNaWVI3NjQ3blIwTjV1alc0dno5cTc4WVM3ZVl0ektK?=
 =?utf-8?B?YXpBSjFkbnN3RW9meEJGVmhzT1JoUzZhLy9NMFd1enM2K0tJUDBUSjBsN3VI?=
 =?utf-8?B?Zi9kcWQ4WFV0VEV2ZWliVDNHc3k2UkZabS9aT0JmVnA4TWRTZllTQ2VHQmlT?=
 =?utf-8?B?Z082ZDhOczV5SDJsS0RXS2MrNmwvQTFXK3V5cUM4ejM4Y2dQZ21iZlZWcnhM?=
 =?utf-8?B?RzJ4dm1BYkJnWVV6Sk5JRlZmMm9oVFVhYllYdUpaaGJIb1ExSzVJQWVaWkJ0?=
 =?utf-8?B?a010ZlB4WmNEK2VTOTdHTnBuTTZLdVVVbjlkTE5RRFllbmpmODlzdE8zbGxp?=
 =?utf-8?B?ay9BRmNBN3ZWM3YwWFY2cjRUeWgwZjIyMm1JSmJ4NzhZMmhudWVmRVVOS2R4?=
 =?utf-8?B?NGJYMitDYlJjcW54V0RQMnZnSk5IZDEyUVZERmx3Wks1UTZzN2Q5azI0WW52?=
 =?utf-8?B?VmwrQm54R3liVXNFa2oyZXNPUW1WRUMvYkh2dkNhTnBsSm1rRDFQejRHZzVP?=
 =?utf-8?B?RzBLelB6aGJ0TmFMdm4zWGQ2N2FOK0dVU2dVNHlveitXSXRlb25xdk1heU0r?=
 =?utf-8?B?NDd0Q2U5RkJzNlpGNUZBcDdLaGJTRXJORThQYmZ5ektaOUVIQUdpTGtXK2NF?=
 =?utf-8?B?UjlZQlB5MGZnYm1pK3NDQ1hNTkxSbEVzN3VYVVd4SFM5MEFUVVkxTWNPS2dC?=
 =?utf-8?B?QlFDM2kwZ002dllzcGtzSW1WaXhGOWpHZkFIRC9XaUxiSW95SnNoNS96UnMw?=
 =?utf-8?B?YkVmS21ucUtkWUZDckg1RXd6czJENDFTRDJhdUVocDZRWFpySjR2WEtBQzRU?=
 =?utf-8?B?cFRRYmpiTXhXV2lnTmdRaW1ZcDFXbVJYMmpWUGJ6MVZuOXd3dGJLbTRTd1NF?=
 =?utf-8?B?TkVTTlZtd3FVajJqR3RSZXU0T2l5QUEycFQxd3ZrckNaSUp2RmQvZWdUMEg5?=
 =?utf-8?B?RWVISVBmam10TDFMV1d5V2FIZjVtSERnTXdUZCt4SDMxVjI5Q2w0L056NWdX?=
 =?utf-8?B?eWF4Vi96bmxWNmZyZlE2eXpoQ1RpdjBqbWx0N2FUMHRtc252VGl2UzdHYTlr?=
 =?utf-8?B?cEJEaU1DOHpVNFZZWGx0ZnBUK2IxdmdIUklwT1hPbTZRYUowWVZ1OXFVKzNh?=
 =?utf-8?B?U2ZqK3h4ZUlNSTQ2KzM4ZkN4Tk5ONGFnaVUvdlhndEprTWFRU0tWSFl6NnBR?=
 =?utf-8?B?YkZuSW5ZODFYVHVkKy82MGp4dk4zN3UrZVRhM3haazNNZnR1U1R6cy80RU1v?=
 =?utf-8?B?WmpXais4c0tzejVsOGw2d3I1QUVBV3U5UHprMjVlSmZ5SnJPZ1E5Q29NNVdF?=
 =?utf-8?B?QWxjaGkvaG9iU0czL1R3LzNFeEh5U0Z5OEFWelRsc29najFRcjZRcXRwVGph?=
 =?utf-8?B?bU01dVBYcE93U0NmWlU2d1VyeHhqV09GRnNuQzBweFQ5TjN2VFhDYU5jb2pm?=
 =?utf-8?B?ZGdta3B4VnVFRm5JVDZBZTVUZ1N1aU8zZTZTQ1BMYUNXd2VreDlrMU5zQlVU?=
 =?utf-8?Q?4irnJRQ9oZ2zU/JcYS8mZsQ2tlVojTSZa28j90Q?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4793c07-2b6d-4b42-816e-08ddaf0693e7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:54:54.6232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0175

Hi,

Last updated: Jun/19/2025 @https://github.com/sophgo/linux/wiki

Quick Summary:

- CV18XX: Reset driver updated to v4.
- CV18XX: DMA-MUX is applied to dmaengine/next, will be pulled in 6.17.
- CV18XX: Duo Module 01 EVB board support is updated to v8.
- CV18XX: A new patch to rename compatible string of the USB device for 
cv18xx, v1.
- SG2044: DTS part for PCIe v1
- SG2044: PCIe driver is applied to for-next, will be pulled in 6.17.
- SG2044: PWM driver is applied to for-next, will be pulled in 6.17.
- SG2044: More DTS nodes for devices are applied to sophgo/for-next, 
will be pulled in 6.17.

Thanks,

Chen

