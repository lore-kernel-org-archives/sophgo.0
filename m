Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A6229B02
	for <sophgo@lists.linux.dev>; Thu, 19 Jun 2025 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320743; cv=fail; b=OjzBB6rnNVYRh14yHdIwfom34JlTN2mhCxJ4Q9+LyZPa7AMAiuKyCorcrKCB5Yf4lFy2odDDXSwPhU0jO/ULlwVufq6Mxm0B3y2iPkE28Lp1q9Ak7cALMCxbONBPyUDGvTJnHTy+90Yer5HbcjbMO9Mt3/z/FEXBn+EpeEuAsj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320743; c=relaxed/simple;
	bh=qzREpQzbErsbDKLDcfQs8twLgItY2m7z+71B4wkG6J8=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3OsHuT7zkbDdNRKwEdXZKzoZtQfsWl+iFXtmcgprJhNozWDkVdlFDHzIsm2DUiH3shNW5OlIJ+eKHqLYIafRA74uqeI0EfWwPMy4ywQFypN5856iNH8+y3/DcWcsZ4mjWpsRrC6hDfAcVHEK6WAoXmb6icub8L5XfDs2vqn90g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lNG24fb5; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lNG24fb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNd1UubJ0eCZzlGmQ5qiaHDdd/XyRPWeq7mnTGMGkPfyayCyOy82zkuzyH6HUVqRDHmX6HoWLBKcRHZDdbnXaolOrpIYMCpLPfJ5ne89yvIHFyiYXxhpug6V93tu4E4LVehMbZ4QVRXv3BTofq3RSzTUQutVL0hm4NLOhg84tny7mHM3mEj+A5JPcBFITJZKvAFXxFN5mrVFNpzCB00Fk4hl3mN0n7nManlE3ztr4dPma9H2DHQ8lEHI/pYv73K7PzzHCpwvSjeqpK+K24/Y6Pd6CR2MkPkiywynvSuft+EC4SJDD0eP/c5w6sZky3hvlXb2+HUDFhNI7TsQZxk9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLHz9V6oJw3HNRqnVobEPW216u7gA0uDeMzsnYe5I+8=;
 b=IrC4+eZqu7fGC3gfFppKMmwTKldWoUSG2K7i7nXhHEBzlJGw3MUbnj0GQuBNnYS90rzV/fCRhd+XLwKknMeBYTU1atzXr7WCzEaqRwnXySH1NmqAUt96qog/tjPwfTLHNWmohcf1uXXXLblQn2v1NThUO7H6gnsfd2Xv4Pc3dninB5pXDxt2DAtra3URKwi5FBnhtAUsGPm+r0QhW0HeLIML3tEb9f0nT7AqRdJz61FWfyBs93RDL7cqPuA+TxGprkrwFd0RJ7Fr9xv3ELC+Fi/6y8X2N29lJmSzO+KHtbyA2wQv22u9YwC/OQ7XJV1GMphWcajiuot/EjlpUjwkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLHz9V6oJw3HNRqnVobEPW216u7gA0uDeMzsnYe5I+8=;
 b=lNG24fb5bxQ2zXHLN/NjHMxr7npdg1h3d1oTtjZXpEaLpxIZvHuwaeMdWM3bYozrvGcv21Ha8r1DvlV5oLCbnxbxL20pMxf7vwESAHMAMS36AqMrH5DNFj7gwJQRLRKHoDOM2xBvY9B/NI4/7oYqrRFNgoh7YntDHZfbD2rNbK1kB708zjcMg/O1rmOcQvLpxVgE59rCpwcENXWAjJVhLE0GGwni8gMjssvt1qiWkiaq2OcrmupjU6bR8rDeQpzvw9p/kVScPvZi2kRft18IXxfhHlpYIXbW6O18kcBWOZzmT5HicQh/ABobbGH8MGvuUgocq2evIDH1+QBapW5KOg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0481.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 08:12:17 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 08:12:17 +0000
Message-ID:
 <MA0P287MB2262BE8A666F6893781A56BEFE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 19 Jun 2025 16:12:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Upstream Status updated: Jun/11/2025
From: Chen Wang <unicorn_wang@outlook.com>
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
References: <MA0P287MB2262826AF772B598BF98B51BFE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262826AF772B598BF98B51BFE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:4:54::25) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <569468d1-344a-4c81-9174-ca9ca643ecaa@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0481:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8058f0-a9c4-4d03-40f5-08ddaf09017d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599006|8060799009|22402599018|15080799009|19110799006|5072599009|6090799003|1602099012|440099028|13041999003|40105399003|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3daNWUxM2NzTWNGMGtrZW52UUl0ZldwaTVWU1E4czVRdG5INVcwY3E1cGF5?=
 =?utf-8?B?alRtSDBJYkxZVWg5UmI1RlZjcGpZNGpmTlgzTk42Z045SURQaFBPcnlBK2ZU?=
 =?utf-8?B?NXZDRDdhTTZqay9keWkxcUF6MkpNemx2TFUzMy82Y1h5Szc5SzUrNk9YdjdX?=
 =?utf-8?B?R2JxN3Rpck95OFF2ZmFYWkJTSTAzbnA5UkE4eEsrMDNuQjlHbTJBUy9PT2pX?=
 =?utf-8?B?TUljN3VidytNcDU3elVxVS9oQ2xJZlJ3Q0h1bmc0R05sbUp3ZUZlQUpCQzlM?=
 =?utf-8?B?N3FZSVk4cXFKVU40YUJpSTlzZXdReHUySkFsNmxlTGZuQk85VDN2cUxxNktS?=
 =?utf-8?B?c3AzMHN6WDkvTFlVR0p0cmsvNTZCZkRBRHlmY2NXbzJwQWFudmlMemttb1hw?=
 =?utf-8?B?aHlra2JrdTdESUFxdmQ4aW42d3RlTUpyS2wyZlZ2TFRmaFVvR3VMd0ZJL01M?=
 =?utf-8?B?R3I1YTNkVHd3T0dtOVBXVkcvQmUyVnhyNDhGUjhDd2plNXR1cTdUMVFPd1lI?=
 =?utf-8?B?RHNMc2VINUJJZEovLzNtK0tldVBqWXlObXJrRzBQa3U0bldnWElqaDR0Z0J0?=
 =?utf-8?B?dm8rcTNod1FQRmNwMHJXL1RKWWlkTTZldEU4MkxSdGNzV2xLMHlHdVplTitX?=
 =?utf-8?B?Mys5K2JWT0FXeEpPTjFRNzZwZkNEVDZUUkVNdGZyaWtNRUtGK2JyaWFCMU56?=
 =?utf-8?B?UDZiaXJIWFBSbm9wd1hNd1ZleE9mSjdOa2dKaEY3SlNEVCtjYkJzMkpYTlI0?=
 =?utf-8?B?MGRON2tWWG1aeEs4ckE3OXdxNkg4U3E4ZTk4Nm1MMDZLUTdZdUY0T3Y0bHpW?=
 =?utf-8?B?bUU3TDE5ZU9oL2RZM1hkc2l4MXZqWERKVUtQd1R1dVZaUGE3LzZjenIwbThG?=
 =?utf-8?B?WSszZXFETTNmWVQxRStNNEJtQlR5S3Fqckp1WjU1cTVaUXN1SklXcW0vZEUw?=
 =?utf-8?B?cWNiVXFYS1E0eGlETE5mblNwaEREb0FWTnJ0eXZDK2gwNUkrTTVicURkOE1w?=
 =?utf-8?B?c0xLTGt5QldvMkZtTTJCYkwrMmF5S1dIbWtqRzdCakEvclB3anY2RVdpb1B4?=
 =?utf-8?B?U1AxdFFaSDNLMmlZa2ZUemc0ZzVmNnZScmszRm16QVMyREYrY29rSm1Gb0xY?=
 =?utf-8?B?S3phK0pnWlRjdFI4TCtlcjVlZ25aTnhrZ0Z3K1ZJS0NmVjBhR0l3dTgzM0tC?=
 =?utf-8?B?SHYra3JHdkJ5bFhDckF4NngzL1Rpa3NqajBtd3U2L0grSDFodnpKVFh2MVR2?=
 =?utf-8?B?V2RIY3ZKWU4vSjVFVFg1cS9mMmxXWGx0Wi9zcmt6S1FlckVIR0prNUZsZERl?=
 =?utf-8?B?bGsrTzdCd1NuWHl0TlB6aXByeWVTUFBzNm9VenRMajQ1emU1RlJ6YkZ6NXpu?=
 =?utf-8?B?cUtKNHpUOTRRL3FCWm91OXpQVCt6NFcyczRsai9RYTBWaXN5TVlDM3NGOTI2?=
 =?utf-8?B?SFZCMVEvT1hoekN4N0xyK0dnY0RCT2ZkUXBNY0RvU3kyTFk0TWsxbXBlbkxa?=
 =?utf-8?B?MHI0aWlvazloeVJ1dzBYT1luYTVtOU1LaFpGNkx0clNpMHFPNlY4Q1JzOU8v?=
 =?utf-8?B?V3lvaU1lN3gyZW9VMHRqYmZYbEd1NFFiQjdzK2d1N0lsd2d1R0JVa2xUZjZY?=
 =?utf-8?B?YkFNUXYySU1MNUpLeVJEL25kOC9NR25RZ1ZFa2NFMWVzall3OStzZWNZc0ZM?=
 =?utf-8?B?M3ZjK0JzSEExVUR4YjlRRlAzejRUVHNHenZhUnNPcEIrQnFkYkVmam4wclda?=
 =?utf-8?B?VFJWOXdPZGcvVUZ4d0xSRlN2cXRneGgvZ29JYU9abmFERlZsM0tGZWJGcG5Q?=
 =?utf-8?B?cnlMQW9kYjhUdTc2cUhGU3BueFRDMGhaaU9nQ3FHVFNVS0JSZXdTUXFTZnlo?=
 =?utf-8?Q?udm9IFi1oT2YC?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZCTlhUeTBCZVl1WThCV2owNWkxV3FlYW5NbGtjYy9ldDlXbXRrSFY0QzdQ?=
 =?utf-8?B?VldaRE9kSnVjc1pWQlJLd2hvaXc3LytMU3lUMmhFWWF6V0FUM0xOZ0J6SnEw?=
 =?utf-8?B?b1UwUjV4VVIwQjE2TmtnWFBjVTFUb0hmSXZDZm9KSVN5TGpDZWl4VzZGeEpJ?=
 =?utf-8?B?UDgweHNqVHlpcVFMR21ra0FmV2M0WDQ4UEd3Q0ZkMWlKMlpUalZJbTkxN1Q2?=
 =?utf-8?B?cUVhdXovTlphWHZ6M1p6aWdNZTVJMUVHWnE1NlVJZWEvVVp3ODlWdUNmL2hE?=
 =?utf-8?B?Z0ZzN3lyWmhsbG84cXRYdnlSdkRXZ0FQaW12RWJGS1hjUTlGSFV4NjBHVHBO?=
 =?utf-8?B?UWVXeWxnMkZiRG1XQTZCc3h3REcxWm0zT01sTVhLcG5id3ZKVmFtMTIwZE9p?=
 =?utf-8?B?S2NyV2lwdmlmWXh4a2FjeGFoUXI5N1hiRUN0dTU5b3FnMnNFZis4aVhFODJs?=
 =?utf-8?B?RHhPNW52enh1ck9rU0wrK29UQzdobzlxeTVQSzlsK0lwWnlQcDZ3ZzZoWjVC?=
 =?utf-8?B?S2EwMXhCT1d2RkFpaDc4RkppVU15cEx5RHUxNnk2dmRsMkllMWF1VUxWekNo?=
 =?utf-8?B?WDZiQlhBVzh1NmkvMWd1N2JtZ1dkay9VazNXdzJUK3dNaFlkVHIxc1J0K2Vk?=
 =?utf-8?B?S1Y4MUEyTEIvc253KzU4LzhFUnYzb3p1a3AvT05RU2ZVcDd0VmF6WEF5L082?=
 =?utf-8?B?S0w5OFowa24vUTRzK0VmV2Nid3EvUmFINTc0SWdUT0FUSVUyMEcyYlM2K3J4?=
 =?utf-8?B?QUhLWHRDTEhwcFY3bC9QdWY2YjIvblczNzR5eFBWUnJua2Y1Wm5QcDRUWGlL?=
 =?utf-8?B?Si94RjJjRTczSVVoVmZ0cmpveUg5TlEwSVA3blVrbDdmQ2g3YWlSdXlkZXA4?=
 =?utf-8?B?ckJKSEJKRC8vWVQ2Zmk1ZWppeHlGVnZhM1BTWFkySXlsM2UweHYraFNKWnFM?=
 =?utf-8?B?cWNjVVE1b3hUelF1OTY2ck0rdzZSandQZFlNSWhoR1puYW9MSGlpUE1qK0Zk?=
 =?utf-8?B?SmNHYnlUVmxlVUFNMXhPYSthb0lRaEM5cFZXZmlPL25pWi9KQXliQVIxbWd1?=
 =?utf-8?B?RS95UXpHQkZUamRWYndUbUtPaXA5anhxYm5oMWo1ZHFVb1k0dCtkM1dxS0dn?=
 =?utf-8?B?dExqdVRnQmhNZmN0MVlMVWN0QVRRdmU2V0pCa1FCYUVSSUdSam5YQjQ3TU5u?=
 =?utf-8?B?b3hyMFFSenJnN24wN1B2TXBjTVhnSG9EWUoycXBKdWU5amg4c1VaQWhCZDFi?=
 =?utf-8?B?TWlpRkpJU2VwTXhqUHc5eVl6ODlQanVCRlJETUVrSXlGVHpCYVA4S3NMTEgy?=
 =?utf-8?B?NHFObWMrRzlCQVg2M3JiZTRrVkp2QWhjMTZRaktjMG1PZHd6TkFScXRNN2Zh?=
 =?utf-8?B?SVNTVU9lTHd2TUhuUE9WRmpuTTBOdjJmN3FRN3lVNEhTM1U4alkzTWk5MDlQ?=
 =?utf-8?B?LzRIc0xEK0g2RG4xMjZOZlFaTXVMZkZBeGxsbDFreEQ3eDFJNXNlVW81eEFx?=
 =?utf-8?B?SUhkekQwdUQwUnU3TzFnT1pJTkZJb2JsMHJaOFQ2a2VyaWNVRHBMSWN1S1F1?=
 =?utf-8?B?czJtRm9rdmptSkxOS1VWR2UzL2NYUzNENlV5TjNhdVlLQjFudHA3MnhBN3My?=
 =?utf-8?B?Vlg0YUE0RWZXZjd6bW13dk9ZQStGSTVieTM0MVdYTFBuZ1BSd0J3RitVOG9p?=
 =?utf-8?B?SGJENTRBdjVpaUI3R1YxNzM5QjUxY0VUNDY2cmx0Vk9Rejh2SDdHT0M3Wjh2?=
 =?utf-8?Q?yFzK0ZlFY+d65KLj+YjQQnwrQVEPVZ6PDb/nYEy?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8058f0-a9c4-4d03-40f5-08ddaf09017d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:12:17.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0481

Sorry, wrong title and date, will post another one.

On 2025/6/19 15:54, Chen Wang wrote:
> Hi,
>
> Last updated: Jun/19/2025 @https://github.com/sophgo/linux/wiki
>
> Quick Summary:
>
> - CV18XX: Reset driver updated to v4.
> - CV18XX: DMA-MUX is applied to dmaengine/next, will be pulled in 6.17.
> - CV18XX: Duo Module 01 EVB board support is updated to v8.
> - CV18XX: A new patch to rename compatible string of the USB device 
> for cv18xx, v1.
> - SG2044: DTS part for PCIe v1
> - SG2044: PCIe driver is applied to for-next, will be pulled in 6.17.
> - SG2044: PWM driver is applied to for-next, will be pulled in 6.17.
> - SG2044: More DTS nodes for devices are applied to sophgo/for-next, 
> will be pulled in 6.17.
>
> Thanks,
>
> Chen
>
>
