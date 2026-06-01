Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010011.outbound.protection.outlook.com [52.103.68.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03A3358AD
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294001; cv=fail; b=rG8ibNSG1Lm3q0hBUbrbpCkM6P0i7smFVB9LMCAq2WMzQ6NKUFsECOH3q37swIEWVCSTgQ/9akzOQ+JC6wTagY3Ktl72ef2FnjOjBxBtV3s1eRZpEhS0ewGdiyeb1LQvo3k3GhytFV96LU+eWOXlQlvVq8+dKkkXN9gc9/XuLkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294001; c=relaxed/simple;
	bh=ZHkSgKayHtYLidbIzKQT/6pBh4QuZG3xxUiZzzqIPRw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j29O+WaGpWBHEJNRYtZj8AjW3sZoKI/+JlnIZn00y0eKDdr2GKfJvXtFAoUjM2RPYSlCrBVXh10jtjonYGvtl35A2c7XJUKjFe7NZEBT9J7DRGAJy412HRe6sOjSagirmx5uw97HpDoWMKTZl3FHbjt+to3mn6Lu8qZJC1TlBRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AxzivycG; arc=fail smtp.client-ip=52.103.68.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="AxzivycG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJYZkg0H2+NAUdV208Sgzlqkpvrm8y9CEROABmXCU7ierUEh6qwprBYOnvTh4EunLu1FutHDH+M9wTV5PW1BclcBJbc3rwsbBOoBkMVgfTBd5Q7oEdsWkFo+ohXx9OvhvFKtOCk0KyBIz+UPw4L4leHN6qPZ6d+XJ6sDsnhvqtDQ3OQRtWYql9EXOg4bG3J02OSj/H4NtV/5QR24ag0XdMU6cm7hYmySvyAquOwPOhQ3NXLsITwr8J+4BHjAwY1BEp0pBQWVTB4b3dgvkuBlGbzsPNJlXqx3HYYzrL2Uwel+dt1jz8qq7EOHlm8faB1KNCj9qfgvZx4g34jMtUcvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyJyeBM+1b9Jgf4k5N45dblznq6eaMTwv6y+0Td5o1M=;
 b=ZYhLs2jlY/4zM3vOslObFppgRnKUdjsM7+63FUgom2I8yEc2wuZvvNdAXYKC6IO1EN1Xuw++74FlgPj0QKTtsDvTRhzQ3FHRLR8H+4t3eH5I7m1m1UTHZyaXT+2aJKqUoq/fbCHL/OHXtgSQ5cmHXH7wRTaHIj72NzSXeTgTXMEsudK8r7J49Kd8Dzig4JtLyjfJNq6TPWVQEBkAGoxIW1BsmK+UKr4DsHIrHSiSRCtp0ayOqpG50Gok7RlgrN/Hkf4FF/QQ76B7o1OBYdzKT0TW1Y3H2uVcJzW7Pq9UiTKW/MqjVhTk3aOHDOpifd2gBpC2SrasUL/A9VhZk8EBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyJyeBM+1b9Jgf4k5N45dblznq6eaMTwv6y+0Td5o1M=;
 b=AxzivycGnBNXzXy5EtnnI0BD+trHLxcgSSkfolFQ5toSqjRova1ijQj7Q/wyW8zM/xmmHk+DLo/Y5D9XCYMYMD+qX9n7nTEDm5zs52H503iVluOwRGBnk7m9fPZYeIswRUG+tDk1WQLiF7JzalQfjv+BHuTS/axbmslGTsoQYGQAQkMPkg4lf66Tt4ophsKksRDYzN8qnxtXQv6E14r4+lWYCrRrxhx/souaTXAHNtsWgZq8t0iGL57NDc5MsrdEZqy3vhFW2Fx8DX16NQAnaaGKSYIJIF9bM0SwcisrX4O32M6Y0mEJ334WxBMjJViaClKPl1I3JdfaxqqA2XUFRw==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MAZPR01MB9051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:10f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 06:06:34 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:06:33 +0000
Message-ID:
 <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 1 Jun 2026 14:06:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: SG2042 SATA (DMA?) issues
To: Michael Orlitzky <michael@orlitzky.com>
Cc: sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>,
 Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>
References: <ahu57vcS0oOFmCI9@mertle> <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ahzs8MSmNU7_vsIT@mertle>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ahzs8MSmNU7_vsIT@mertle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <83c22f39-4f8f-4abd-815e-e351cad6f935@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MAZPR01MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ad2aea-f944-40fd-0d47-08debfa3ee4a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|15080799012|8060799015|6090799003|23021999003|5072599009|24121999003|22091999003|25031999004|24021099003|10035399007|3412199025|440099028|4302099013|40105399003|52005399003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHk3Qk9VY1NwSmk2TGRab1JnNGlxb25qVWEvT3BOb2UvOUpmM2J6eEdwK1BQ?=
 =?utf-8?B?VUhNWnZyMCtrT0hrYzBUMjg4R25nWVFsSmIrdWdEN1E3SjJKTzQ1Vzl6dFpJ?=
 =?utf-8?B?V2xCZVFsenc1ejZ3dGRjQ0Q3dlZidWZ0ZHA4M0RwcHFDanhtOTdEeWFtZGdv?=
 =?utf-8?B?TW1EckJVekdTOGFIUjBob2VMdVBJYkhXbElBMmZ2YmRQR25OZjlBVTR3MDdJ?=
 =?utf-8?B?RkN4dSsrMkNQTENTRVBaYUprVmhubWQ4TDgxSUJ6R1I2c1JJTE9hclArZDJM?=
 =?utf-8?B?NHFWM2tMdjgrakhpZVVCZnE2MlFzOTJMakhkVENHdUNQNGFXczJiKzdKdUZX?=
 =?utf-8?B?anlpUXVScldGcnJKdWNtWkh6NFoxQ3oxU0VSajRCN2QvazdXRG1YMFRKN285?=
 =?utf-8?B?U1FPbFl3bWtUMDFsNVV4cUFXc3RhbUZ4NnF1aEgwdjRnZ3MxRVRtamRWVGdr?=
 =?utf-8?B?aXN4MlJkbVFnclRkUG44a3BLMVlLemZXZmc2R1ZrQVNpTFF0MEtZakI5TEg5?=
 =?utf-8?B?K1lIcU1hMEdHZEQ5bFkwQXlvbmx2NGNmSm5IcldnRW8zZDgxRUp4bk9DY2FR?=
 =?utf-8?B?RE53VzVJQjdqWjBXQVZOV1lwODNJTHZUcnMxeThWRnBmdld2VFI4ME50RWl3?=
 =?utf-8?B?a1E2cDc5VWRJcE9oaTFYWTVvUnJ0eThGUDV0T2hjckhYQ2dhUmpseVZOQTZ1?=
 =?utf-8?B?Z0x5YzFuZ2E4bFJtOWRtZCtOV3FydldBcVk0M0JXRisvUmUxdG9Xd0hzWk1m?=
 =?utf-8?B?Z3JaVEJLaXdQSEE4R0RBakJ1QVMyb2c5SmtKUUR0YmVheGtDcE9ORHhqRXJW?=
 =?utf-8?B?UTdHR1BlSEVjd0F2Ry9FR3cyUmw3NkVJZ3B1MVpaQjJqaTBnUGRkbmpMMWY2?=
 =?utf-8?B?T2lhMVdEVkU2QkkraTZHZE9jMVptaXY3SDUxRGZFcFI3L3NNUWt5dkdIRGV1?=
 =?utf-8?B?blc3MS9SVlUrYXNIb3lCdjI2TUdXNkhCZ1IxakRya05xalJHZTM3ankwdzJo?=
 =?utf-8?B?M2xicnJ5SDYzbHFFRFllNzgwMkliRUZMSFhMeXZkRGdIK0pjeG03dDVuOG1n?=
 =?utf-8?B?cnFhQnhiZ0VUemZWb1MrU0lGUmZ2a0hLb00yMFFkTjJBSUhPTndXRkp5UjZx?=
 =?utf-8?B?ZUxZOHFWQ3FKTnEycUUySytEelFXVTRESFh4T2NpeFkxdkNLVjhGZVM1ZGp2?=
 =?utf-8?B?aU51cjA5WWxuMFU1VGlQS1lTRi81U0tzbys2YVRPeVhGNktmOGpPdWszWVpO?=
 =?utf-8?B?bkN1SHg5WVZsck9qaHgzOGs4REQ3SXI4U0F1WFNBM1JiVytBUktzQ0hBUXF3?=
 =?utf-8?B?M2NQeS83WkVoSjEzTDVHUXA0WW85eXRVNnNjekdweEVGK2F0dnUxMVFiNDgw?=
 =?utf-8?B?N2Y4VUxyUnNTbEFQRjR2UXZBME50bVRvUnZCVUc1YTFVbm9FN1lrb1dXejFL?=
 =?utf-8?B?c3pDSmVSWjV0Y3YzT0dxTlg3SVFTQlpWVUFkRk9nQSt4N3hBa0RZUEdQVEsy?=
 =?utf-8?Q?ewhOsE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBBQ3BvVGR4cFEwSDM0cnlBc0FBdk92MWZaU0U5MXRsbFRyZC80QzJyNmNM?=
 =?utf-8?B?NjYvMjAyeUJOSXJCQUNiRyt0NWJMbUhTWWZDNzhUanRTSkVOeWF5ZkFXc1VT?=
 =?utf-8?B?UHZVVGVaMEllMFpkZXNsVngyNVFqbmd6WFoyMWs2YmdMWUwzRDBaTmFyT0FH?=
 =?utf-8?B?QTQrYVN5QnBab0NFRE53ZkN0YkVkdDVEdnJROEFjWU5naFRqdmdnVXQ5d3Bv?=
 =?utf-8?B?enlkdUNpM2xUak9SWDdHdWJYbXIxSWxuM2M4WnZvamZmeVpkYjlLTkFKOWw2?=
 =?utf-8?B?dHh2L1lBclVBOEZrN3Blbm5rY24vbWsxUE9EMnJEbHBtanNYWXVLOFhtRnBS?=
 =?utf-8?B?WkhXZmU0b0xaUjJFbVFXcWlScGtiWmJHRjkwVTMyeWRRallCNmw1anRSSjJq?=
 =?utf-8?B?TlZqb2VqRVZieDJMckpFY2dUN0JPRVpudEFUSG5UV3l1UmIxV090eHVrSVdk?=
 =?utf-8?B?SFVocnM1MzNnZDZoYmREZ2tJb01UYzNjYmVnQW1DSTFyVHZqWGkxRXRXTXBx?=
 =?utf-8?B?OFpTUWRFanVZOWM3ektUUEZSR1BIWlZIRWJIL3BpZUx4eVNIZWt6eFI1Vzcz?=
 =?utf-8?B?Sk9abjVnSE9lTHlHYkJKVkpPcmJCTmdNUDd3TTFTN1JvbkNQUTVkMHNDUi95?=
 =?utf-8?B?TmdDcWlHV0FKNUgrMlBBSWhVZEFqMEdMWWpWTVdCVmx4Q3I2S1ArQldtQUxF?=
 =?utf-8?B?UmhuNllpaHQ0UEtBRU4vWkNDY1RoRXB0UW4vVkdIODRsWHA0Q211czZ1N1lu?=
 =?utf-8?B?QkpaTG93OFlhM0hqdUhLRXBwQk4zcHVwcnZDdEM2eFNFODQzZnVLS0V1Z1R2?=
 =?utf-8?B?bHBkZ2NIQVJjbnVacWZuMnF5cDFlNjkvWitJK0liT3NLeWUrcWlYL0l0aUZm?=
 =?utf-8?B?YkYvV2thbTkwQzN5bll6Qko4Mys1a1A3RW1Wdkk0UDBSZHJ2N01Md1BpZ3dD?=
 =?utf-8?B?N2xqWFRjUzNheGZqdExFWDk0azJreGVVTXc2Nk1QY1gyU0ZVOUZOMllBQ3lp?=
 =?utf-8?B?U3NVRnRmTFNUcWMwNndRcWdPVThQNVZPVm5WOC8wZW9oaDRQRktWTmRjNEZW?=
 =?utf-8?B?Z3dEY2RpV1JDKzVMMHFLZXlWZ1JDYTAvSWpxQmtzdXQ2eWduUm1OK01vc3dN?=
 =?utf-8?B?QSsweUFmZEk1VnpzUUZ0dGhkcTQvcWhHWk5VYVZ2TDBQV3RDaDI5eFQxMXhZ?=
 =?utf-8?B?SW5Cb2lOWDA5ZUY0TnRDeE4wNHZwY283K2tjQWpaZVBhYXc2eTRZdW0vaHJs?=
 =?utf-8?B?Wit5bkNEd003V0F1eEhKNVN0WGluZU9xdk1Kd0FZeVEvUFVBOEpLaFJtYS83?=
 =?utf-8?B?QUxvTzZrVFdzRXBURnpjaXp0cUNUYVN6emNORDUxZWR3OTRxTWE2OTBOMEwy?=
 =?utf-8?B?Z2orcTFsRWhRaVhQQzFacDZ0azBiYXZVcW8rQ3pma0RCZTZyeFBhTTNNVC9Z?=
 =?utf-8?B?YW5GZ2N3THEyN0lnVTEwY25MVTlveEdIZW1vc0RtYk9YUzk2c0pRaVFJc3BT?=
 =?utf-8?B?ekxVbGdsUlBTcVlvcDQ3Q01NZjh3SjYzaW5YSThlRDljbitLVTVzQmNNNEJq?=
 =?utf-8?B?dzVjQlU4a3R2cHFla3dXT0czV0x5WG9qOS9PNnpBRmRkYmJEN3lYZjEvd1g0?=
 =?utf-8?B?VUNPRUoxTGgzVkZpRmFSUGF1V1duVUpOYzlKVGlOZVRZRlZpQ1JiajZuNWhR?=
 =?utf-8?B?M01wRDF0Nlp6MEhjYnhidGhYZ0VsaVJScWJCazh0YkN1dGIvSS9JVzVteWln?=
 =?utf-8?B?REhybXFwMVdQZVZnNjl0VEhwQXJUZnFwWUxxK3hsMzVtbGxLVVlEZ0V2bzl4?=
 =?utf-8?B?N3JObEI3UWJlWC9aaTFRRVUwL2xFbHBaQWpjMmprNXdGakdBdENYbzB6UEpa?=
 =?utf-8?B?WVphWXBlcFVnWjlJeDRvcTdITWt0a21oWG5sWGp2QXQ2VVJWMjRYdFBwMy9D?=
 =?utf-8?Q?qFf09SOyXai8dLZ35LXLCOaNorNANdA8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ad2aea-f944-40fd-0d47-08debfa3ee4a
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:06:33.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB9051

Thanks for your info. Some more quick questions:


On 6/1/2026 10:22 AM, Michael Orlitzky wrote:
> On 2026-06-01 08:31:21, Chen Wang wrote:
>> Changes related to DMA can be referred to at
>> https://lore.kernel.org/linux-riscv/20260331171248.973014-1-gaohan@iscas.ac.cn/
>>
>> Hi Michael,
>>
>> please confirm whether you have updated the firmware mentioned in the
>> patch email. If there are still issues after updating the firmware, this
>> patch may need to be reassessed.
> Yes, I have git checkouts of
>
>    * edk2-non-osi.git
>    * edk2-platforms.git
>    * edk2.git
>    * opensbi.git
>    * zsbl.git
>
> from github.com/sophgo and am using the sg2042-dev branch where
> applicable. The problem occurs with fip.bin from,
>
>    commit b379b0674328be40c9811032193014195944c664
>    Author: Chao Wei <chao.wei@sophgo.com>
>    Date:   Mon Mar 30 21:27:39 2026 +0800
>
>      SG2042/Boot: Update fip.bin
>
>      SG2042: Disable PCIe write reorder on single chip
>
> which is one commit ahead of the one linked by Han Gao. All other
> firmware components are at their most recent commits.
>
> The SATA drives had been working for over a year without issue. The
> first occurrence of the problem in my kernel logs is immediately after
> a kernel/firmware update, so to confirm, I looked through the git logs
> and reverted each firmware component to an earlier commit:
>
>    * SRA1-20.fd (20251209)
>    * fip.bin (20251209, from the bootloader-riscv repo)
>    * fw_dynamic.bin (20251106)
>    * zsbl.bin (20251215)
>    * mango-milkv-pioneer.dtb (20251215)

Are these firmware components correspond to the https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36?

>
> and of course, I reverted the kernel patch that adds dma-coherent to
> the dts, and replaced sg2042-milkv-pioneer.dtb.
Just want to double-confirm if we use 
https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36 
plus the dts dma-coherenet patch, how the SATA works?
>
> This seems to fix the problem: I mounted and unmounted, copied to and
> from, both partions for a few minutes without error. (I get an
> unrelated kernel panic in amdgpu_irq.c with this firmware/kernel, but
> was able to test over SSH after removing the GPU).

Thanks,

Chen


