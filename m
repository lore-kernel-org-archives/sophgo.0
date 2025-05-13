Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010013.outbound.protection.outlook.com [52.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF7645
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 04:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110714; cv=fail; b=rArV28WKf/Ej2EH3aIwCFdISrUtbrQxYwhHaLe64Y57TdgjQ6QEHHTzw+DwfRbVk8a3/FRiLNwSyBkPehpZqRxQrbfo38yPQgwXiMgpVJA63RFRafbTWIInsP/m42a65NJIIEWYh7R7N3gmOYMTrQWFYQ6t8CHQ1237RkuKn4BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110714; c=relaxed/simple;
	bh=zfk5zoTbblwmqPqcPNvYsHssLZrehMD9e7gVr8OaZz8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lnufQ6LyTcncBB8t5S3zJinitGTxKRa79GDKk0nAOvQi/jarHpRqN9obhCcOz7StaeVRnbASN6uV49xP9XjCJIk+BPjUMFHbTZkxjaGFXiOcpEMYybsMTDE6ROv0ItKMRlRw+7VQcsmyoklnXRFLvotKmA2O/wRwUROLZkA5Zgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=EfEhXmsX; arc=fail smtp.client-ip=52.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="EfEhXmsX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeZpaEg4UIxdcDK6GoGZqp+49J+0qE8wfn+k4g5NsoYpZwmv5xawJIM5RMY8BkbH/Awes3a0LV72sJVbYcncSQqvHK+tuh4dTIZL5I/w7qg1U5YCnKYOCDsIk/dJL6di4EehMag2deEJaLTZPrKquREu42/bWT/rxrJKbGwTysfQ1PDuT99hQOWwRyJBva1xef5ZoehRQTxEeF5L2YKLdpcpcyVdaEbs2tSttGJXgY1M4G/TKWRuCqSQu3pv0OfX0VUWmv5qONvJra2CE8vLINjQemPP+iOCa/qkb7HbgPC/dWPdfQqOmWB07SGN84gVLY9phREBtlB2vaRxkRYNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+ufHFIpxHVc5UCGLmN/8YBVsHpqlO+k50dzGCchnY8=;
 b=DF4GVjdhmV08nTpoBDh3CQ7UcXRjSDN67z3iHlYqfwSbn29+tG80BtFKUZz43+snDhOz94za2DDua6epGHwat0CL9avD9mwhyeE3Hwc2pRVqTHyj+IyiuH5gSVzLw5ovfl6jgbZKGkpypwhJLrrtIKiZ6pAn0QVzHmlW8tRE+rrk3krLXy5sSZgJD8TEELzyPV5UrYTeL8ZlxydgexiMch1nNTQkxaaXBNWQJX7SF5la/8uk1Zi+FJQ6k4MidOjF1yriJCAn6Fs0Xk1osv0efKyVNpeuW8OBWxaMlWbaGzJQz00D2y1SfdIUN4B1SxooCIHhdnUnBDaW42H3UCvv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+ufHFIpxHVc5UCGLmN/8YBVsHpqlO+k50dzGCchnY8=;
 b=EfEhXmsXtjXwX4/QZvtJzMMRzoJR7bJ1lu1RxXz29KNw4FfNO62c0AH0GKoxfXfJ2x4neKm4fYPz5uRlf46/ibhWqnujhyJSLoqVtROmDyEdBSGbIWi1m6xzYl4+OBd3//JjfWr8TKCD6+5bkYWTEGZsifcp127hWMRPeXSPxM5X2s5kTm2dgd4Xdsv/hjAxQm3mVefAjytNUuy4PFaUNQht7z131wgQbkiOGzFrMORaHJSesbQC/6endOUgJI4g0TnDqPUWdk8j+pmMORfdDlDnVYrtp2aK6LSoixwSAapzUWhWjSNOw1PsnbuRwVhgncMvJ2INHwzDA7HX6sZw8Q==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0628.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 04:31:45 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 04:31:45 +0000
Message-ID:
 <MA0P287MB2262FEFF458FFB4F2A656F90FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 12:31:42 +0800
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
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <72f22f4a-18c5-4689-bf0c-9af7730413ce@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0628:EE_
X-MS-Office365-Filtering-Correlation-Id: f78a6407-be96-4d8c-409a-08dd91d7113d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|461199028|15080799009|7092599006|8060799009|6090799003|5072599009|1602099012|4302099013|3412199025|440099028|34005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjRRNzlLTEpVSmpiVk5nOGNRbEpXSTg0Vi9YVkJXbWJ3VGxXb292TFdoemNG?=
 =?utf-8?B?a1NGa0pFR2FQS2kzOFFWYWJwRmM4U2E1V2hyTWhxdFpiTzEwb1dhZFFnbWor?=
 =?utf-8?B?Y2phdmxSb0Q1RkY4YXZZeTN5dnBtbllNaGtibUNhcnhkNjltM1pvTTVUN3Fw?=
 =?utf-8?B?NXBOcVVaWmk0eEx1WlA1THYwZWFxbWE5Wmk0QklrZ1NPL3ZOQ01xWHA2bkFL?=
 =?utf-8?B?cFB5TGFyWXRNWmZRdWh2WXk0OGtqT2IyYXdVbGZlVFFwTitscGhvNUF3VFBI?=
 =?utf-8?B?REI3N2lmQ0lUQjhsZHVkbXYvcXNCZ2UzOFZUdHJJclVyc2k0Q1hSYU1UakpH?=
 =?utf-8?B?Ky9tL1BWNWRRSDhBVkYyaXRYMGxIZUhsYVRhSEFNYWVEd3I0N1JnSHFrc3hL?=
 =?utf-8?B?aHNDODNCSTl4YmxZbU1zYXFuRjA2cXEzM0RNY01hMiswSmh4ckh5c3JCUHl1?=
 =?utf-8?B?K0pNeGk2akJCUXNqbkdqa2k3dlhoZ2Fhd2wvWFFxVGNEdVVDUnRMRjRCbjY1?=
 =?utf-8?B?Q24vaEdxMXRzcUs5NFUzUVVnY055QTAxL1R1VklSU3BraG1pc3d2KzFaa1Zu?=
 =?utf-8?B?bGhyamFVZ01UVGZPVmx5K3pVd05zWXU1K2xiTUJDRzJPL3ZMSHdwdnVLQnUy?=
 =?utf-8?B?V1hrSE1VUnpIOUQwQ2JJWU1sd1JaMlJlckNYL1dmaFh1a3FQOVFma3NYZml4?=
 =?utf-8?B?a2lLTGNGendITmkxaE5jV09DQU5zdWFOanZZeG4xdkJ2Q3dmSFVWMmU5SHVp?=
 =?utf-8?B?TDYycnA1QlpDVHhsMThudWpUWTRDVXdWZUdOSDFwekNmUkIrazdsMWNKcGp2?=
 =?utf-8?B?T3l6WFhzekxoNFk2U1BOcDBnWnVNMGEwTWJSNHhteVVnVEpDcHdGR3JOSWdV?=
 =?utf-8?B?M01CNm5QbWw4UDBtcHU0TGt4RDBaaVFIQ3lFSVZkWU9XUTNJZ2RLVE02VmFo?=
 =?utf-8?B?cVc0MHR2OGdVZm50UXdLTzZnMXBGY0hJSEVFRTNWQmxxY2t3TGJ6VzBxRmdH?=
 =?utf-8?B?TnZrYUc4Z1RzOXB5aWViaHBxTnNaQUdJY00rU2hjUWE3cm9DT2t3THhqNVky?=
 =?utf-8?B?Q1NWZ2NIYWdzMXFwdUM3Rk5rTDJNNitER24xTFFFSk03ODBDMzlWMlpaM2FY?=
 =?utf-8?B?czlETlBHdGREc3ppeEVWQ242YWRLRC96ckdtUlZEYkkwNDVxTWl6UEgzWXFX?=
 =?utf-8?B?WWVFZmU0Z0JhVy91bHFHL2g0SlF3aVhwWWh0dGR4SzdFMjA4ZVJKQlBQeWtH?=
 =?utf-8?B?M2VQeWlQaGZlZjEyb2g3dnZNWDZoUHdQSFplM2tqSEVENkVkMnRiYmpIWVY4?=
 =?utf-8?B?Y24xRVlzYkVtbEdEU3dKVFV6cm9DUkJQU2lHeDVSNnFaUXo4VWZjS2NocjNp?=
 =?utf-8?B?V3pQeGtvb3lmN2RueTZ2UUtaN1dnYmdDbC9nMlBNanhMdEF5eDRVa1BHTE0z?=
 =?utf-8?B?RDdqNjhMaGdSTUplMC9UL3FCRlQrNXNhTDZsd3o3V0h2NmYvZGF1NlhGRllH?=
 =?utf-8?B?S2FLODhlR0tjNnR1djFqaUxNcmJldHNza2hvLzlxRks0MjM5b1hCb1hGdVoy?=
 =?utf-8?B?WXE2Ykt0Y0FJSTZLYnZkdEJ1ZzZ0aVAxMm5YZzlac1hMemt2MkxZT08vK3Z5?=
 =?utf-8?B?VHY5cDdxd0FFTGVpUTRjck80TUQ2bHVZV2dWRW9sdTN1aFJRR2QzbXp0SHNY?=
 =?utf-8?B?M3ErQ1FRZnVjM0hIVTdJSnpYTUZ4NmIyRGRLUTA3cTJyaGhoeW1FZ011S24x?=
 =?utf-8?Q?Tm3zTvO4T8U7z+Eo28=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1QeENUZTZtTzBZQkxrV0srOGFxMlNjeFlyRFFQaXAvVmR1RWhsQU1Ud1Zi?=
 =?utf-8?B?VmtOVzFXbEZETFMxdldCY1pWbDFXSHdoN2JNdDhhcGM3ZU4yMEF0NHVDUUo1?=
 =?utf-8?B?dGd0MnQ1SkxlQmRQZmMyR3NEK1JFYXJsV09pRmxIVTR4VkVOdGlvaWUwNHVL?=
 =?utf-8?B?RVd6UUx5b3NwZyt6U3pINGlaY2RvL3F2RFMzWDFhb0MxZndIU0I5WW1seUtk?=
 =?utf-8?B?Sk5YSXdPNkRqajVQcEtidzlMUkNxRit6Skk3RlZtbGdxbVB2YklEOGNvM2ly?=
 =?utf-8?B?bXpjejlMWk5QdFl3WHNxejIwa1ZFR1ZvNlFud29BMlBBUUtvQ2hrdEtXY1JS?=
 =?utf-8?B?b3Via0FBNVowLzFyTllhQlRENDFoRm50ZWROK3dnSjdDcW1TWHpCOGkzTUJH?=
 =?utf-8?B?YzFSVTVHQkJLb3NBNlNhd3UvZE9ibklkbTZ2aFVLV0oxdWQwZjhXcWkybjRs?=
 =?utf-8?B?anJkYWNrc2JmVjM1dHVEQzdSQzBUR2xBT1UwS0paRmtrazljdkhseDY3NG1j?=
 =?utf-8?B?ZHUrS3ZhT2g5eVFoamVRVWI5RDdKa3pEdldTNCtyN20zT282K0swblBoRTRX?=
 =?utf-8?B?N1UwTVJFcVVNdnIrZ3BQS2loSjFpSjZtYjhUdmRtY3QzbzFJMnJVMkx5K0F0?=
 =?utf-8?B?UDB1akxxVDNlQ09mRmRmdXYvNzB6dS9tam1sOXZUcGo1MGFLSERIUFNGRmF5?=
 =?utf-8?B?TVVZQ3lRZUxrYmVralVMbVhiNmpjVy9hWURzMUVHeUQxTmY2YUl4MnRjMjRr?=
 =?utf-8?B?V1RrWWcwOVdyTkY0MU5KajJ6eXNiazhlc1lkcTdnVDlNNktkK1UydzllNUc1?=
 =?utf-8?B?amk5ZDU2K2dDUi9nQTBtL1FIRyt6NmM0bVBQNXNLUmpXUEY2OGtoU2dXam9x?=
 =?utf-8?B?V1ZGWVZiczg1a2xxZGx6eGI3emU3ay9Ma2l3ZTZOWkpJN2pMc0ZsWERZTVlW?=
 =?utf-8?B?RDNRUzlHazBoWVJyakUvZ3dReEdXQ09TMHFkazVzT0NOWG9iaE81a3Rkd2ZG?=
 =?utf-8?B?Yk1BVFV6Mi8yMDJKcW9COU92T1FBaVhBdjNCOHVrYkFOWGVjYXNxdXZUOUR2?=
 =?utf-8?B?VlM5aC95eUoxT3cwWmZQYkpWTU5Hc1Q1dENUSlp2RVhKRUNXdTNvOWZnV3RT?=
 =?utf-8?B?bDVaK1F3bUxPR2FmU3d4bVRDVGlHOCtkczFJNjJ1Q3BQOTg2cU1UNWd3c0pG?=
 =?utf-8?B?UWRTeHlBbGRHMGkzWFVxTjRTb2wzTlJvUFA3SE0xdVZOb2dmMEF2c3Q3d0tT?=
 =?utf-8?B?U0hNOFUydTgwOCtXVkZ5UnhwZ2FnSUZKbG5iUlBqS0EwazQ3cEgvR3pmNEFJ?=
 =?utf-8?B?NjdNZURHNEs5aTRocFZxYndpNmFqUjB4dWhJdktPYURXVFFYcERoZCtJc0hl?=
 =?utf-8?B?RUNXMnl5K1FNWm9NMlNDVmxKaGVZZWJyWXExZDdDYTFLazZLZ0dRYWVCMnBv?=
 =?utf-8?B?dVg4Q2lLc0JOcUNnR2tOMlJVbTUrZFplZ3dNNUJuNHBreWZLTEFGd3J3Y1hw?=
 =?utf-8?B?RDBVcU91eHYwNFEwT1ZHeHJoWEliM3I2ZDZPdFRMSkVmenNsZFY5bjFMS1hx?=
 =?utf-8?B?T0ZncjZ3azVCL2g5Uy9rMjNlSDJ0a3lkU21KZHpzVCtSeVJEcStvS09KcktT?=
 =?utf-8?B?WVBmOGVJY3FZb2NmaWxkMFBBbUlYYjBMYU8rdTg3aW1sdnh6SEllcXZsOHhX?=
 =?utf-8?B?RS85aUVMLzMreW9QbmNLcWNwSHhKckg0SnRqTmFRdWdLK2FTclZrd0lOeUVw?=
 =?utf-8?Q?sbML8aigLsJRl0hu++h7EdfoK5QjmoTmxbwtDCX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78a6407-be96-4d8c-409a-08dd91d7113d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 04:31:45.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0628

Hi, Arnd,

I see you have picked this pr into arm/fixes[1[ and for-next [2]. Will 
you pr it for 6.15 or 6.16?

We have some other changes depends on this fix. If it can be picked in 
6.15 cycle, we can PR other changes for 6.16 based on this.

Thanks,

Chen

Link: 
https://lore.kernel.org/soc/174680703718.3673480.14977600965554828034.git-patchwork-notify@kernel.org/ 
[1]

Link: 
https://lore.kernel.org/soc/174680704498.3673480.4157416148847871729.git-patchwork-notify@kernel.org/ 
[2]


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
