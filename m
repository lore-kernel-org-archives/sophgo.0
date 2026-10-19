Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DBC48BD5B
	for <sophgo@lists.linux.dev>; Mon, 19 Oct 2026 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399001; cv=none; b=gymesNPN2brDr6rTCqQUmO803pmq3ELx60PZzkgCV2twoS2+v/5Gt9SD2af4fo7liBnuAv5lJm1mxFHlhC7XNOcTSmevcKy+xEGVGODsjtwHc42Fe0eBB/SBR3dU3Wa47VQFx6AaePPwyiOWDofQcJ5oQFcK7VgMfohEJDxeEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399001; c=relaxed/simple;
	bh=Fkql/pEOQaE3VVKr6TeO/9vnVJHDezf5e25RtfA6m3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDzSKX1vGb31GzEtpEHMRRy8mvuO0TvUYSj0+4p4VXmmd6lGWYau68Ngc4yuIEfDYhch+9Yn0xaD4QsSqzUrBppJuiNlnhgkhnDMlYLZeoqMKuTt04ynTTXgGNuR5bKzpfMWnQ0FVlkE/NFbH05JyEP/dmdWcuX/cFEcWgF+hzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KTEXuZDT; arc=none smtp.client-ip=95.215.58.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KTEXuZDT"
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Fkql/pEOQaE3VVKr6TeO/9vnVJHDezf5e25RtfA6m3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792398996; v=1; x=1793003796;
 b=KTEXuZDTQO+fwxuE6kZ2YYQrwrao6nV5sbly7CCoR1oOcGp2d28RgbmJII6dyU4iVVhl8pCA
 W7vlzhnbCNZJDxAU8YS2+v46wzMuUiWMybYzg99smEJWm/4bAFrdFP5avqVcAx+Buj/JXZ68XFJ
 GU+cmqyu1JLxzwRacXWkTB/I=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7040c2419ab9fe67;
	Mon, 19 Oct 2026 08:36:36 +0000
X-Mizu-Trace-ID: 7040c2419ab9fe67
X-Migadu-Flow: FLOW_OUT
Message-ID: <1036bcd5-09ce-47f0-855b-1f1fbf248825@linux.dev>
Date: Mon, 19 Oct 2026 16:36:31 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
 Hiago De Franco <hfranco@baylibre.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
References: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
 <as802eClIH7MpxBR@inochi.infowork> <as-_ZlweuKWU1dsc@hiagonb>
 <CAKspUhL1HMT14JZARuxnoh21+mH+7_9rJRggqu_s-t4_CZB8PA@mail.gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <CAKspUhL1HMT14JZARuxnoh21+mH+7_9rJRggqu_s-t4_CZB8PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/16/2026 10:34 AM, 葉宸佑 wrote:
> Hi Hiago, Inochi, Chen,
>
> On Wed, Oct 14, 2026 at 02:49:15PM -0300, Hiago De Franco wrote:
>> On Wed, Oct 14, 2026 at 03:56:02PM +0800, Inochi Amaoto wrote:
>>> Instead of taking this patch, I wonder whether it can be converted to a
>>> generic DT overlay file for all the supported boards, so we won't needed
>>> to merge many duplicated patch for it.
>> thanks for the idea. I can think about that, but in this case the other
>> overlay for 256M is already on linux-riscv/for-next, so after 7.4-rc1 is
>> out I can think about merging both overlays into only one file.
> Since the 256M overlay in for-next is mine, I can take the merge after
> 7.4-rc1, if that suits you.
Chen-Yu and Hiago, you two can discuss it amongst yourselves, just make 
sure there's no duplication should be fine.
>
> Only the Duo and the Duo 256M would use it: the Duo S and the Huashan
> Pi already enable gmac0 and mdio in their board files. Both labels come
> from cv180x.dtsi, so the overlay itself has nothing board-specific in
> it.
>
> What I have in mind:
>
>    1/2  turn sg2002-milkv-duo256m-eth.dtso into a shared cv18xx-eth.dtso
>    2/2  compose the same overlay with cv1800b-milkv-duo.dtb
>
> 2/2 is your patch reduced to two Makefile lines, so I would rather it
> stay yours, sent on top of 1/2 with your Duo test. If you would prefer
> to do the whole thing yourself, that is fine too, and I will test it on
> the Duo 256M.
>
> On naming, I would like to settle it in this series while the 256M
> overlay is still new. The overlay is named after what it enables, but
> the composed DTB is really the board plus the IO board: the base DTS
> already sets USB to host, which the IO board's hub needs. So I would
> call the composed DTBs sg2002-milkv-duo256m-ioboard.dtb and
> cv1800b-milkv-duo-ioboard.dtb.
>
> The reason I care about this is my own setup. Besides the IO board, I
> use the Duo 256M with Ethernet wired up without the IO board, together
> with USB networking over the USB-C port. That works on the vendor BSP,
> which uses OTG, but not on mainline: both boards are host-only today,
> and the host setting in the 256M DTS came from my own board patch,
> copied from the Duo.
>
> Once the overlay is done, I plan to look at device mode on mainline.
> If it works, the host setting could move into a usb-host overlay:
>
>    <board>-ioboard.dtb = base + eth + usb-host
>    <board>-eth.dtb     = base + eth
>
> IO board users would then see no change. If the composed DTB kept the
> -eth name instead, it would silently lose the IO board's USB ports when
> the base changes, which is why I would rather rename now. That part
> would be a separate series, of course.
>
> I have both setups here, so please feel free to Cc me on Milk-V Duo
> patches; I am glad to test.
>
> Inochi, Chen, does that layout make sense to you, and any preference
> on the names?

Are there many expansion I/O boards currently on the market for the Duo 
series? I'm not entirely sure, but my suggestion would be to avoid 
adding too much support for expansion boards to the main codebase, 
that's something best left for others to implement offline.

Inochi, what do you think?

> Thanks,
> Chen-Yu

Thanks, Chen


