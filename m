Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308F2EB10
	for <sophgo@lists.linux.dev>; Wed, 23 Jul 2025 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753237569; cv=fail; b=JeAtkgjD4pGXTNU9FcHFk8JRzNQUfFNxMYaWX1+wm/svvDAY9hcF030J5DJ60Oz8t2isg8Xa/eTA+d2RFbWY2hJqc5BevwEO2UFmkQf6gNY+Yv2u/WM0KMkH+bb+/vCopLoFv/YFLRyJWo85C5X5TgpE41P8EPHVoGSCSo56aow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753237569; c=relaxed/simple;
	bh=EPJkQTeawwQ1NKtTxR0r1UX4CSzsyVmw1grruba9Abw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S4xULYizOlC9brVTRIo1jGva4ms5ClrZweWgkIUnqCs8PEgIb5O8OUNJcHhdxjgRTqZGldaLKnOS6n9fngWhNApuBi9ZVCcFSTCX7Y+QV49dwV0oKt/et+t+zsuTmK6RMGTCNJi4iDFbF9sSUm9XoDScE6jmQqkA8Q+tJGfhbfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=njPQ7k/p; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="njPQ7k/p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmnpHhg75l49pDdJBQiDczvZwQr16a0tgTzdTu6oYQpeug30sh2KT4nrBoSKksCs7Q7magmasO3YtNKu/WMYSjVzRRfxSHyrq1dr5wkXZ6hTn1fKDTumWgUPrE6UXGd3QNCQB9bGyNjZWpvwCYq6pNLmMgsdzn5r2gGv/C6xFeQNa2LB0mBG25Ugqi4kWhpDHMUIpMnTRDXFRI0csXVa1xQk4zf6wrE0M9yC41kGmuB1XOrzXcD1JnNGIHGiLO7nc+1fUlNyTxfW8SnAPx7c5Z3aQCADHJNiLM8fcriX/pFv7vDSOC9JHR9Kj6619mO+z7LAEYs9UO6gPT8P0VdmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsjxxB0HaHVI9cXe09xUJrSEB7vBUXSyIHW3sWKRoI0=;
 b=OZFLBAronG9vavJArV+4DPHw5wJjE92o86Hhp551tjBGdO+w5gWkvz/Lin3EobEwu2PEJZVks8ef1aMh0TXiEdjN3+6c7rUgAoaIA7EYBZlaH3R+CpG49nBnaKtx3Hw3nsfi8iPKp15wcvZNKoh/wJgJhfW/y/UIc8ljpFEmPdsrN829/Dx9BtVQvu/wKlt5mzBJBlEI6/eNqXtpiTOzWmoH0L6y4kRseDb1f33C7o78JLR8uebMC76g90fahn61oxUP9jzfS4G5F0MOXuB6hxyd119gZS5Q9Xtx91APOJOV4J2ChWeE6ZHbNdsJZ04KqRMv9W7EYQjCNHgAOkJcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsjxxB0HaHVI9cXe09xUJrSEB7vBUXSyIHW3sWKRoI0=;
 b=njPQ7k/pLLjxp0CfiQR7lh1xqrZIBITI+nubq6XwJIsngVpOBCn2ziiS9X0bhL3cMVXPx8+pVP3ZjPdZSrMqf5phUKGnINa1zy/YSdTLwHWotfvn2HTwafp6kOw5MNIE6lVggkixLB5HNghmDCpxTZxON15OToW/cQxjiedLW7ds4gbrfrZlf3rkEwJE7WgNlaz9lX4uEKIPhp99X3v6tm9PiElfnNjb5umpTEmScbWe69U0bAZckBUxx8Xyltuqs8Ex+tjv48yQy/VG97a/FlMD8f5WEw+TPQfWyaVjyvsHJJyELQBXjaCIb7R1NiKqFJHUGAnJta/GVd5GLGKC4Q==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 02:25:59 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 02:25:59 +0000
Message-ID:
 <MAUPR01MB110720B28DEDC03E9E9585833FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 23 Jul 2025 10:25:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>
References: <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
 <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:4:7c::31) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <3ee90af6-85e0-44a8-ac86-e67fd40643e1@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5f7695-4321-4dee-bddd-08ddc99042e2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|8060799015|19110799012|5072599009|15080799012|51005399003|440099028|40105399003|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OC9UMHd0NFQrVXE0WDFGVkxnT1VyeXF4OHAwdGlWS25mSE1ia0lYZ0FmSFVB?=
 =?utf-8?B?MHlhUFFQbXFiMjYwQTVETmgraGZRcm1MYktvWW50cmwwaU5nS054VklSTnFR?=
 =?utf-8?B?QWxUTlhYL0VmU1NPK1VUQ0oydTlOT3MvalJOd0QxcWZJSTdPU2xrZVRYaTdH?=
 =?utf-8?B?WEo5Uk5jZ3RIVndEb01BRVlhS1dkNE5VN3hTRUx5TUp5YklhUVptbnBJblg5?=
 =?utf-8?B?WDFEZWUreGlIMnE3dGxtaThqdDA1WmdNZlFpalA1OWpvZ1luWW9sNGkrdExr?=
 =?utf-8?B?Ri85ZkdvaG9vMkY2WFU2OUNiOGJhZjhuN0EvcXJkckZ4QjBQQ2QxeCszekVX?=
 =?utf-8?B?RkM5YncrTTEweFZZdXc0U0hmcFRvNk01OHpqa1paekdxZ1ZYYWFZOE1WcHlz?=
 =?utf-8?B?NWJLV2VIbk9Bb2ZJbDNHYVFyUnNzUjUrNy9jZ2cyRVRtWHF3MStnelh4TFQ3?=
 =?utf-8?B?T1BqbmxUQUI0UEZ5WFVsSEl2eTlpRmFheHhweVBMZjltRmVVVDVvQlErdUVZ?=
 =?utf-8?B?Ukswem4xREo5SnIrMEpHdjNuRVVLVFIvSnJYczVNamttRENGQnhPVzlVMTdV?=
 =?utf-8?B?SkxGazBkY010UThrNHVjMjdoUE5MbW0wMVB6UmxKOVZuMDZBOWVUY2FnS2Fm?=
 =?utf-8?B?RjFTcXJsNEIyMWN5MWJoNU9BeVUzWC8wNFRTL3FuRVhvSHV3N1lULzZMR2hM?=
 =?utf-8?B?SDl0enBlTDFvZ0p2UFZMMGhudzdqNEFDb0JsQ1I0ZTM2OWVJWXZpZTNwbnEr?=
 =?utf-8?B?NE5tRDJXZSsycFJndXVDYlpVZjRtMGxvVkkxaHZubmVBajMzTnZWWXZ5TS9s?=
 =?utf-8?B?R1dYYUxQWVZ1aWhJSC8vYVhUbkQ3c29BSVBmT2NsTkpxRVlHZEMvMWRYaStS?=
 =?utf-8?B?cEZyaTY1alh6WDZDS3Vta1Fqb3NtTEpzNkZTZndPMDcxVjZTUFc4TXJCU1R5?=
 =?utf-8?B?dFhVVXpuSm9IL2h6QXNhVWYxUXU5NEgrM2F3OGFkL3AydjFIVHVUNllRVm9G?=
 =?utf-8?B?THAvaWJKUWZQVm5lUFNrZDBBYXdnMGthcXgwUFFXWkRQeC9tRHVobk5ZQVI1?=
 =?utf-8?B?eTQyNUQzNTRoaUNUcHY1K0YwczlFc09IQlF6c0dObFV3MGJmYW9FS1BuZXFJ?=
 =?utf-8?B?UkRnRmI2VTNGazhlVWcvM2tOMDBWS08rWEM4WE5ncjlkNHRoYnVKMHlONWYr?=
 =?utf-8?B?NUlSYVhIYjFQNUNWTkFrNUxYNjNHNk4rbml0WHlOeTZJenBOYnJBWksxN2RD?=
 =?utf-8?B?OFlUV3FoQ1NsZFNpNmxFbWFJYkRSb0Q3QVNFTHdwRHJvcEtjQUZkL3U1VTRl?=
 =?utf-8?B?K1lIRTF4Qzk4Y3N2cHNxUmpsSDYzVTVyM2h5NExrU1c0M1Z2SmtpV1daTTVJ?=
 =?utf-8?B?SmtKWU1aY0RFWU5jZFAyL1BGQ0c5NnNQVlBOQTZoWVhIMkZwdnVEQlhBbDF1?=
 =?utf-8?B?K1dtdVh4UzlTVFc3QlFzczVJcGNXVFhEclgwZW10cDBtRUNNMlpKTGxaNEpu?=
 =?utf-8?B?RlMwVFhqTEV4UWVwVUFKWUEvT2Y2TkM5dnF6bHZoR05hZDJZNTZkNlZweGRZ?=
 =?utf-8?Q?mZsq6LSaah7s+FrAZB4K8TjsLfQ/9/gLm7g8dm7k9gnlkd?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NQUUNCb3VwcVRvRFJVRzFHNkFPbnJpMmNZOEo2UkJDd1NSUmlXeTdEaTFS?=
 =?utf-8?B?TS8rZ21ob3dXS2IrRXA0ajFzcm1qdFV4SDRJWHZ4WkxDcE9XWmxWNGFRbGJU?=
 =?utf-8?B?blF0RmN0U2FvTFpMRWZPclB2ZC9aT1Z6MlMxUmxVK2UrMU1JWE0xazYrL3JU?=
 =?utf-8?B?M0xyY0hDT0gvcHd1Q1RvbjhhUGgzVGYxY0tRdmE3dkxFU0E2U2JVNzIyWFVi?=
 =?utf-8?B?bFJLUkYzMkltaEJJelJuS0hhS096UzlCUFdCb3FXQlJuVjNpVU03VDIrZVpm?=
 =?utf-8?B?aG1hUStsRUxqTDlYQlB4cEF5cEhnTTFJTXM4azgwRWZNd1Y1Wm95dVFqY0hO?=
 =?utf-8?B?UlJ3Zm1GU3UraG5NdGNkd1d1Z09SYW5OUjk3VWxNbnZHaW1POWIrdHR4VEY4?=
 =?utf-8?B?cjAxOWZqWlY3dU9lQlBXU3JQVkpac1p5bHRpQ1pZd2R5SGhNNmRmeS9WZDBD?=
 =?utf-8?B?aWxITkVzNTRpZUl4YUpzWTN6MjRBeFIxWG5vTEtneVRGd00yTGVpQmM4U1BJ?=
 =?utf-8?B?azVsN0FMbjJwUmFDcG85eExCWDVkVnFYdDhGSDR3b1lnYzVvWHR3cGN3bjRH?=
 =?utf-8?B?R3ZSc0pkSStkR2NqeEVNODBkbS9kQ01YNjYxbFk4Z0FsQnhhalZ0NVNQc1Zv?=
 =?utf-8?B?a1V2c3ZNVjhQdllHaEJhRDVDRythRVo2Tzl3MERKWVo2ZFdYaWRyS2pvQllI?=
 =?utf-8?B?cC9wYjB0V0o2ejhWSkY1UFFMSmJaZDh2SXRTT05qZGFSNlkyZUQ5amR2U0lx?=
 =?utf-8?B?d2lmMi9yMC8wZnNyZFRIN1ZkRE1RSUg5SGNlMVBUam5vS1c5WGVWQWF3V3Bn?=
 =?utf-8?B?eTBXQi91TFlVWEs1bmRWSUlNaFBLZ084T1VjRWYyb2NTZCtweENqNTZMSUFS?=
 =?utf-8?B?TFd6U0lWNmRkMHZhMXJyRndmanNKWTBocFJaS1hEVjl4ZHdaV2E3YlJxUU1U?=
 =?utf-8?B?NEZXWHZlR0dZK0pTb2V4dUY2dTVuVWhxWlhaTStXQjBoNTBPb3dnbnNVb1dH?=
 =?utf-8?B?MXFrSWlaM2FzVThSNzI4TDJVQ0p5KytKUzh1a0c1eTBQN1Nud3BWZ1pjOE90?=
 =?utf-8?B?MUxpcWdBYmt3UFlnOTdQWlo1N2ZvZVVpN3R4OFRLNTczTVNlRm5Md1dLN2lO?=
 =?utf-8?B?aldlNE9EbExaWGV3OU1IYXFsV3RNZFd1RERXUnBQbGJCdTFuZVFEamJrS1NB?=
 =?utf-8?B?cFVKTmI0UVVVSkdXWXF5dXZpN0xQUSt0ckxNU00wVjdJcGloMnNhOUxtc1dM?=
 =?utf-8?B?ZEFNektrYnZ3UWRwZjZHVDJZK3ZLdG00RlZ3amJraE9MZXpXTmduVm1OUEFW?=
 =?utf-8?B?S1dDZGtaM3A0QXB5UjBzYlQvTjNyVU5ac3BDN083TzNYbXNmSk1YeHp6L0x5?=
 =?utf-8?B?aWxaU2hJcm9pZ3NGcXQzeHAwS3Jod1lKRXFCcDFSQWZRYXdLT0hXY0xBNXJB?=
 =?utf-8?B?dmJ3akxzNnVqK1dkQlNORUsxNGZSWTJtVi9LYXhlNlRES1F2dUw2YUsrZEJm?=
 =?utf-8?B?VEZKTzVsbjhNRDFuR1FjWGxQMjh4V2JucnU1alBTbGp1b0dwNjlIUG4wb0VE?=
 =?utf-8?B?MmlVZkRGOEREOWljNlJ2Y0xNZzQzTm5RUWVocE5rczJmYmtwMXZtbC9JRXBw?=
 =?utf-8?B?ZkdIYVpuQjQzcUQxNUM4NzZKald5UmEyazFpeFVLNjRaMUJ1eXRFeGUyM2Nk?=
 =?utf-8?B?SDRxK1V0SWQ5N1k1N3ROWTRuU3FGdE9VcXArSFhqSGF3azg0ejJ5QUQ2Zzgz?=
 =?utf-8?Q?HYVeK0Aeh+uAPtNPorufc5o754MZUFg93yNRCfR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5f7695-4321-4dee-bddd-08ddc99042e2
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 02:25:59.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUPR01MB11072


On 2025/7/23 4:17, Arnd Bergmann wrote:
> On Wed, Jul 16, 2025, at 02:31, Chen Wang wrote:
>> Hey Arnd,
>>
>> Please pull this dt changes for RISC-V/Sophgo. This PR is the
>> replacement of the old one [1].
>>
> Hi Chen,
>
> I just tried to pull this but still see a few issues that I hope
> you can improve first:
>
>> The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:
>>
>>     Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
>>
>> are available in the Git repository at:
>>
>>     https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.17
> You have based the branch on linux-6.16-rc6, but my own branch is
> based on -rc3, so pulling this introduces a backmerge of hundreds
> of upstream commits, which I would like to avoid.
>
> Please rebase on top of -rc1 if possible.
>
>> ----------------------------------------------------------------
>> RISC-V Devicetrees for v6.17
>>
>> Sophgo:
>>
>> For CV18xx serials:
>> - Add rtcsys device node.
>> - Add reset device node.
>> - Add ethernet device node.
>> - Add support for Duo Module 01 Evaluation Board.
>>     This board uses SG2000(old codename CV181xH),
>>     which is dual-arch, RISC-V and ARM64. This
>>     patch add the support for ARM64.
>> - Enable ethernet device for Huashan Pi.
>> - Remove warning for mdio node.
> For the commit log, I don't like lists that simply repeat
> the one-line messages from the shortlog. You can leave this
> part for now if it takes too long to rewrite, but next time
> try to write full sentences describing the contents overall
> as you did with the Duo Module, but don't list each
> added device node separately.
>
>> ----------------------------------------------------------------
>> Alexander Sverdlin (7):
>>         riscv: dts: sophgo: cv18xx: Add RTCSYS device node
>>         dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc,
>> add SG2000
>>         arm64: dts: sophgo: Add initial SG2000 SoC device tree
>>         arm64: dts: sophgo: Add Duo Module 01
>>         arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
>>         arm64: Add SOPHGO SOC family Kconfig support
>>         arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> It's ok to mix riscv and arm64 commits in one branch, but the SG2000
> series from Alexander should really be a separate branch. The way
> I organize the soc tree, I have one branch for dts (and binding)
> changes on existing SoCs, but separate branches for defconfig changes,
> drivers/{soc,firmware,reset,...} etc.
>
> Since the arm64 contents touch both Kconfig and defconfig files,
> I would like to see them in one branch that combines the sg2000
> dts/defconfig/Kconfig changes and their prerequisites, so I
> can add that to my special "newsoc" branch that contains similar
> commits for the newly added pxa1908, cix-p1 and andes-qilai SoCs.
>
>        Arnd

Hi, Arnd,

According to your request, I have rebuilt two branches for PR (temporary):
https://github.com/sophgo/linux/tree/temp-riscv-sophgo-dt-for-next
https://github.com/sophgo/linux/tree/temp-arm-sophgo-dt-for-next

Please check whether it meets your requirements. Both branches are based 
on v6.16-rc1. If there is no problem, I will submit PRs using these two 
branches respectively.

It should be noted that about the commit "610f943a66be dt-bindings: soc: 
sophgo: Move SoCs/boards from riscv into soc, add SG2000" on 
temp-riscv-sophgo-dt-for-next. This change was originally made for 
SG2000/ARM, moving sophgo.yaml from the riscv directory to soc/sophgo 
for sharing between riscv and arm. Because this file will also be 
involved in subsequent changes for riscv, I placed it in 
temp-riscv-sophgo-dt-for-next.

Regards,

Chen


