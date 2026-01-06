Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011026.outbound.protection.outlook.com [52.103.68.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E222129F
	for <sophgo@lists.linux.dev>; Tue,  6 Jan 2026 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665457; cv=fail; b=T5eJ1lOsVNjjZYUhILX1RIW0+ymbkaJMtZOTXrwBD+bHKViY8o44myxHPmRli2ZAcMZlWcDaMm4a+xM5pQNGOxdeO2gERG164uTsTFP7pnadqqMBpEeyvQ1M6dveDMyyc24k4vonrL434uldcrEBVIKerSiMNUC6sUu7rgV214I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665457; c=relaxed/simple;
	bh=6cgCIrMWkfSNwviK6A7BC245dLGReKHxd1JeqI0f27w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UFL3xYBcfqrhIFsC9VnQQGu3pGYTjd4iwHv9/k2+yrlMkuqszdl3+5u0xWq6yOi3HlxaunR9mSSgxWxQXWiB4+HWKtKNM9LEpjjDB7EApwkKr2Lb6N+2QNYcPVmCGzpueczDzcmMMfNGcF/LqU9aZadCh9d/sJDtQhB8zKqfIl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=En4PMkRw; arc=fail smtp.client-ip=52.103.68.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="En4PMkRw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+sNDJ8TlIEf9mCjSU8FsrRojtXWVhLwoKaeid9wtdvBoIWlHNl9gc1l+dilaipPTM4K0gF9P2373ktB+hnGXBePwenl3I9nBq3d8Qdi2Il4jXrXQ+4Anu5Ko7gE4P4Tn2PrYMYM53fOmq/WPEGiau58fsCzmwymvEnb0xdCrbaXOLHYNy9w34A0brgr7FoUegOyWux0XK2YHEPBvBsl/BHNA0PzZZGnJXgHyUVGbUwtFQRcqKgIbSTAd8JCB0DIR4dIISzVf1dtdKKl9o66DeJueGbW2hzZKmFBzDgPTINfyA5dEguAmkHm6eUCTivAoSXMze/P/AP5KQu4hH+Rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsQPl2Fy2zM87fGRjoD7/MiC06smkBlBVYYXm0NCHMw=;
 b=pDlrsWL022EE41dVA+pWZv6j3+/6mdU1K42uMVwua7QYXH95zQ4fEaFtiuzcU82B+dsfjSfaM5kSn5SZG7AqWHIypkBAShlUWEsCihF7fVhud3Hb3tiHjKmB7PNQqE5geejgD/NbevpRmhJD5Gq2jGYN8dKShcnX6q0mnaUkM8Ax8bFDHCB/1h4qQ4/TSoQc2Kw8ayH3Akada9/NKM97j8OuomffeW+9q6VuOlece/Qu96h1yYlUQjgUCN2YGm6PGrXuMqAjxzglUmW11jRiY0p+LBwEsh9BAQz+PzQNtpfe/suB6uZ5nbxj83GjX6KQCx8i69wH1JDGhI0AsYLXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsQPl2Fy2zM87fGRjoD7/MiC06smkBlBVYYXm0NCHMw=;
 b=En4PMkRwn91/F/95p9yfIfF0GN9QkGHGn4hnlHfP5RC8JwbbDN3ktWGGCOq5KI+UKDQjROEiY841pGlC4zVk99nO4ZbpoosaBPbef/E6Jh6FjK+PV3xZIdUaAU2HsL6EkyauRYrEK4IEUY0A5IXH/59adkMYk29AhH/GEXylW3NaiPs4XhaOYG20FERy2TDbAePcN5M+M4se0LzHWfc1yrLOKyHyGkcFxfWbPXCnZe5rsNWpGwi2VtnNVtqMO/hm5nodVy5XoTb9vnX7PhVppoYZ4l+o9CCB4rZ9WKeM5IDgRMo0cknGP2pSvNLYAGlhICKhDljztXfm73r/jQ7ojA==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA0PR01MB5756.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:49::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 02:10:48 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 02:10:48 +0000
Message-ID:
 <MA5PR01MB12500E1E17B3ABE620F928D40FE87A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 6 Jan 2026 10:10:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: sophgo: enable hardware clock (RTC) on
 the Milk-V Pioneer
To: Michael Orlitzky <michael@orlitzky.com>, inochiama@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20260105120129.58895-1-michael@orlitzky.com>
 <20260105120129.58895-2-michael@orlitzky.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260105120129.58895-2-michael@orlitzky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::19) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <a2ebfed9-6648-4a40-a037-7bd3accfe89c@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA0PR01MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 0250686b-2b29-432b-3df8-08de4cc8ceb4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|5072599009|15080799012|461199028|19110799012|8060799015|6090799003|3412199025|440099028|40105399003|53005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDZ4ZW96QTVsWFhsY1B5akpEcEhVTWhoNktaT3FkRWF1VmVHV0dLcytKOVla?=
 =?utf-8?B?ZW9hcTQvUmgyeGU1R0RqczBaQW1tdWVQYW1TQ0htWE9UaTVVV1pyd1NyYUI5?=
 =?utf-8?B?L1IrWFZXRm5QYy9LWVlPT05ydVpFSlF2UkttbUluakZZbitlcGYrZkFURFpt?=
 =?utf-8?B?ejlJMFdTTHJEcVFBWnFLY29HTlVZRGkxSEl4MkxsMC9IdklxZGJhK2pWM3FG?=
 =?utf-8?B?Tm5OZjdwdzE0b1VneVlGUXZ0ZHJCMGtQK3AwcytRQlFlSEl3cGFFUmdvK3hn?=
 =?utf-8?B?dUhMVjlqTy9xVWNXSy9Zbk53bVJRN0EzUjNMQTVNNXp6S2x3YmxseStFNEFU?=
 =?utf-8?B?Y2I5SkJRQjYrRGlZbmRJWVo1SHBOdytKOStKQzBOUEtITzRxSVEzYm42bFNM?=
 =?utf-8?B?YTljSEk0dHF0cGwrY2VwdHd1NlduMGRERHhXZzRMUk9JUzFWMFc4cVhiOWxB?=
 =?utf-8?B?QUtsQjJLYzFJSDJvKzh2QjYvUEZkbEgrSkg4WGgxMER6V21JUlFhdXFnaXJr?=
 =?utf-8?B?UGJzWm1FcU81bUxXaThLZlY5bmpaakZWSkUvSFBYRlkvNXRlVDllK1dQRURX?=
 =?utf-8?B?dmtVaS9vYXNEUmFiMEJnQ2FTc0dONEJyNTFEZGJPVGdVTm9PTUc3MmdQdmdY?=
 =?utf-8?B?dDYxNVVreTYwMUFkR2Y2bVZzWVlvb1A5QXpjYXltTWt1UW1sbndlL2ErUG8v?=
 =?utf-8?B?VW5tbmlaaEFwSGZQMTFsMWFNNU5xZGxSZ0szZ1l2d2pKK3RZUlhEVzhscE9G?=
 =?utf-8?B?c1lxNExiVXphcXhaa2Y0TkxRUm9CZjRRNCs4NUtDL0VhV1E2NXZYODkwN2Vz?=
 =?utf-8?B?cTIvREYxWjVSQzNKbXBTYUxYM3Y1TVNWdzhTVWJ4Y3hnK285K3FmaCt2THc0?=
 =?utf-8?B?L2JZNXROQkVReXIvVTQxaGZrNkp6RzZJU3BHcUdKUU5yVzlGNkwydXZvaVR0?=
 =?utf-8?B?MjhPRlZlM0tncFZxZ0VJc3VHcDZZM2ZKZ083bTdIdHNUbm5FUmJhSlR0Z3N4?=
 =?utf-8?B?TWk0aGlvUkltVFNmQjFFRnovR291R3lTMXdpeXdhQTRiNExuaDVlT2h6YU45?=
 =?utf-8?B?azZjUjk3NE9XRmRJV2grNjNGdnduTWVoR25NK0hUcFR3cUJHWVQ0b09QMjRx?=
 =?utf-8?B?QmxnK292cjFRQXFmZ2srNnBsbE9yOHFNWFpUU3pGaVlvQlp1VTluNHNtUzA1?=
 =?utf-8?B?dGJjN3c0TC9lS3IxOVJ3OVAyNlZDVjgrcWwwVXNvcnFFRm81S2pVZTlwMVBt?=
 =?utf-8?B?Y283enA2K3crTW5CZ3hEelRrVHpIbmhrNEIxZWFmRHk4bTF0alE3YjJyQmhK?=
 =?utf-8?B?ckpiYVJUN1hHNTMwdFNUb1dINDVOWk9SMUljYk9BMWRnc0pQc0RqdXBmV2c5?=
 =?utf-8?B?VWUybW1OcFNrOGFMOEtmQkdEd29BUVIyRExCYkVPbXlZRTBHa0ljRDJYdk1R?=
 =?utf-8?B?T2U3M3ZreCt5bksrd1NaWi94UHFFUmR0NHcrSHZWMDNmdksyNFVlOHNQdmNa?=
 =?utf-8?B?cnkzeUxtNnVRRWVRN3RaWmFwN0s5bmRCVUUreExSZmU4T2NYcHNkWUdMK3JO?=
 =?utf-8?B?SHFFSGN6dWxZaHNxNFVxdGt4THdGb0NSZWJZU3VqVmFydXFydk5FWVArbnJU?=
 =?utf-8?B?K2VuWk16UGdUTDNmNEk5TFdVY3NUQ3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE5UYUhvUzlnVkxGZ2lIaVZQSFJhNUdlRzA1YW1YYnF2UVY0T29PTlZxbzRn?=
 =?utf-8?B?Yk5OUWk3TnZhSzNhaGZzK2Uxb0Vld0dKYUQvU2RzU09HSHFoMWp4MVZiSGZx?=
 =?utf-8?B?TVNoSTU3R3pjRmh2UHRRNkpaV043b3dobk80bS9RTENORGFlQVNnbTZWeUlm?=
 =?utf-8?B?cXhnV1J1TGVrWGFXOHlXeUdGc0NseW1nTkF0WVVhYnNPK2R0RzJ6cXgxYnBC?=
 =?utf-8?B?aGlJZzNyY2JaUHV3Tlc0OXVuOXhmK0RFZTRrSjl2RGhLQkx5ZGxIY2tlNEtP?=
 =?utf-8?B?THMvM1lhTDRaQWF5Z2dtMDF2NkJxY2JtdkRhR1VaT0dOcmdzazRjOW5JcHNw?=
 =?utf-8?B?OWlKVDN3Z2g1K3lPYnovNllnaHE0RHhzQXk1cEVITDM3cFFPbHpMVS90NUFs?=
 =?utf-8?B?MFpITC9GSmFNbVNmYXRlaklkc1ZyNXNMeE4wb3F0NUsyNFFNdXNEMjJvb29i?=
 =?utf-8?B?OGo5L3ZJckFYNEpwRGJlenlYNWFOTTJ0VDM5OE1wMUVSdmpJOXFLcHhkM0lr?=
 =?utf-8?B?M05WZmFSZ000MlFNblR3TmFMR1J3aW9DNnVHOHR0ajdtNHRnbU9xYm11OURF?=
 =?utf-8?B?Vkx3Q05ZTCtXWHVTcWRKUFIySy9JTnVUcHZrZ05IUThybWtUcjRUcDF4aURr?=
 =?utf-8?B?S25meHpCc1lxZHFjYUx3QWNwa2JQUVRZb1JiWlR3Q3Z6VjZYRTBFdW84UXRV?=
 =?utf-8?B?ZE93UVozMU45Ui9UUDFJKy83bTJBYlF3aWFwRmh0Nm02S1g3RnlML1d1VVg4?=
 =?utf-8?B?Tm10SytYWWpXYXJPc0ZnNGxwbEZiZ2tZek1KakRFdytzZ2tVT3pCSWVqWVdH?=
 =?utf-8?B?WmdWdkgwL0RINklSOEwzNVhuTWVXRU5GK3VKeW5YeVFlSzVQTEgzQXJqditD?=
 =?utf-8?B?U0t4WjhheW81N3FGWnp1RnhTSWwxQmpBQVJrN1hhbnBrTzQweG9rRWVFcXg1?=
 =?utf-8?B?cjBYZkc4NHAzY29PUUo4ek9WVzg5WUU3Y0JaM05VNnlNSjB2VWQ1NDlNRWNp?=
 =?utf-8?B?NkZOaGN3SitPSTRwcXpoNTc1UWEwVWhuNDJJQXI1MytXNXpnRHRWNU1UMFI4?=
 =?utf-8?B?WVh1bHExdkQzWHdvQ2NBVkJjK3QrK0FqenpsZG15Z2FibW5FeE1XZVdVQjRF?=
 =?utf-8?B?Ri9qSlJWc0drVk5XZ2lCaERKWkl4VGNjNUQza1d0czJORGxUYmJ4UEZCTkdH?=
 =?utf-8?B?WllCa2hhMVBSWFF6bSthbWhDMWtTM1ZzWDVvcm9rL3oyL2FVZXlrTjBkNU5E?=
 =?utf-8?B?Z2NsVXdnYy9HaDRtS1ZqQTl0NGF3dkhJaXAwQ0pSQUpXaFg4QmMyZ0ROK2JW?=
 =?utf-8?B?UUZ4dHpETXJYRVlmNzRPUXN5Wm95YXMyN04rTnFhM0Rxelg2aG1Ta3hzQm1Q?=
 =?utf-8?B?REpENVFHUUJieWNtQlJpS0pRRlZDUUNaUmRLWmUzNlpLRWlJNFFhL2pURlNE?=
 =?utf-8?B?Yk5xL1YveWU0ak4yTWJ3SHRVdE1zeHJ2T0tVQ2tnaWZGVGkyQkMvKzM3RnZs?=
 =?utf-8?B?MjkzcEp1WHpHOWFHMlN6KzRYNGJMWHIwS004Ly9ZWDBEM3N5Q1ZoUTdmRmV1?=
 =?utf-8?B?ZTJIbU9YbHNKSnlJbml6Zm9GeWgyZDV3SXdMakFWd1czSnJvK2xFWUxvTjI0?=
 =?utf-8?B?dTBFZjVEYno3bmVLYWRCTUpxd09lRGNZcS91K2Zsd3FPeExkakhUeEZIdUU5?=
 =?utf-8?B?QWFtcmN1L1o0NGsrVFNkNUI4TXptUENmRVJPNVA4azhNQlg1QzlEVmk1K3Z2?=
 =?utf-8?B?Y0Uxb3Y4Q3M1ejRuMlFjUVZBY0ozODVyNEtBVUJvZzVvejdtM3oydy9UYm83?=
 =?utf-8?B?Q0RYaU1ENGRLY2hsbFNJOW42dHhZS1I0RXhXZWk0OUQyWnlIeThkMUdtcFJ4?=
 =?utf-8?B?YzZ2bjM4Zk9KVllCaE1hc2pPUzFITDR0eVhPdTF0RWNuQjVtUkt1b1V4RlBT?=
 =?utf-8?Q?48XJN4FVWPHMUCIYgOwwGeJPNozSvED8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0250686b-2b29-432b-3df8-08de4cc8ceb4
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:10:48.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5756


On 1/5/2026 8:01 PM, Michael Orlitzky wrote:
> These boards have a working hardware clock if you put a CR-1220
> battery in them. Let's enable it:
>
> 1. Enable the (already defined) i2c0 by overriding the default
>     status = "disabled" with "okay".
>
> 2. Define the rtc on &i2c0. This is more or less the example from the
>     documentation (devicetree/bindings/rtc/rtc-ds1307.yaml), and it was
>     present in the same form in an earlier 6.1.x vendor kernel.
>
> 3. Copy the pinctrl stuff from &i2c1 and update the PINMUX constants
>     with the IIC0 values from dt-bindings/pinctrl/pinctrl-sg2042.h.
>
> Afterwards, the new I2C and RTC can be enabled with,
>
>    * CONFIG_I2C_DESIGNWARE_CORE=y
>    * CONFIG_I2C_DESIGNWARE_PLATFORM=y
>    * CONFIG_RTC_DRV_DS1307=y
>
> The new I2C should appear under /sys/devices/platform/soc, and with
> any luck you'll have a clock the next time you boot:
>
>    [  T367] rtc-ds1307 5-0068: registered as rtc0
>    [  T367] rtc-ds1307 5-0068: setting system clock to ...
>
> Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
> ---
>   .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index 54d8386bf9c0..ecf8c1e29079 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -52,6 +52,17 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc: rtc@68 {
> +		compatible = "dallas,ds1307";
> +		reg = <0x68>;
> +	};
> +};
> +
>   &i2c1 {
>   	pinctrl-0 = <&i2c1_cfg>;
>   	pinctrl-names = "default";
> @@ -89,6 +100,16 @@ sdhci-emmc-rst-pwr-pins {
>   		};
>   	};
>   
> +	i2c0_cfg: i2c0-cfg {
> +		i2c0-pins {
> +			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
> +				 <PINMUX(PIN_IIC0_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
>   	i2c1_cfg: i2c1-cfg {
>   		i2c1-pins {
>   			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,

DTS changes LGTM.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

For commit description issues, please refer to Krzysztof's suggestions.

Thanks,

Chen

