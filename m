Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB48429029
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959868; cv=none; b=r/FJHjt8hm/lGi4Zs9B2e1kF2oMdG31h+/CZgAl5eLdlQNQHHMdAZ2SFpjOuSaqArcEV7H/ARcRJtTGgtq2eDJdgLY8aXAN6ckPoe8drBq2vk6vSigsRNYbEGK/VAvJDXSYZTnOCXo7DIzzMNpfwBEoQXpRGsxzQNQdvP4EDR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959868; c=relaxed/simple;
	bh=4mXt3T840DbZRtvgoBmn+u5gJsruI7HbtfffX50gWbU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gzdBd9i56LXi4Wio2lvnf2uZro55UWjUGdpTG5ihaxpCX4xHGHJMO/RjQmgpVUU6hzIwYJO5LWcRJK4RAXucOrAPfB9fw5Qt/7R/l1moqKgB85qq3NjK3WaZibSa9vtIe/HsJZVBCOEvp/LW/wxm8pdyQqeKXpyoLi35viowa/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=detello.com; spf=pass smtp.mailfrom=detello.com; dkim=pass (1024-bit key) header.d=detello.com header.i=@detello.com header.b=pCTKmY3U; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=detello.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=detello.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=detello.com header.i=@detello.com header.b="pCTKmY3U"
Received: from webmail.porkbun.com (unknown [52.88.61.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: nick@detello.com)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 8900F46CDE6;
	Wed, 14 Oct 2026 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=detello.com;
	s=default; t=1791959860;
	bh=4mXt3T840DbZRtvgoBmn+u5gJsruI7HbtfffX50gWbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=pCTKmY3U81+1FtXFoqqZGSJ6dIgD7Kh8UfyV5VELW350s8uPODd760NOwq+qBRbd6
	 iHFdOt9esZI6EomJfgMNmmKbRXdDOsumR3As2SrdUQJDdXkNJO/ZdXu/iJvsodN/k/
	 DrispNDmermC1/CsYCjne3h8PL5cf2aGS2VIhloU=
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 02:37:40 -0400
From: nick@detello.com
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev
Subject: Re: SG2000 display: DSI host + LT8912B HDMI working on v7.2, intent
 to upstream
In-Reply-To: <as7tp4C3SDCSq6DS@inochi.infowork>
References: <cdbe4812564fe417b8a7321e035cc7b3@detello.com>
 <817ee00d07821f32f11fa0fdf961540c@detello.com>
 <MA5P287MB6080428F77038F40E008D314FE9D2@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
 <as7tp4C3SDCSq6DS@inochi.infowork>
Message-ID: <058c3f4b65f63dac28090a5cb11653c7@detello.com>
X-Sender: nick@detello.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Chen, thanks for the forward.

On 2026-10-13 23:06, Inochi Amaoto wrote:
> I already had a plan and finished bindings, [...] The driver is a
> hard thing as I need to cover some SoCs with simliar design.

Thanks for replying, and sorry to hear you are unwell. Would you be
willing to post your bindings, even as an RFC or an unfinished branch?
I will drop my own compatibles, write the drivers against your
bindings one block at a time, and handle the respins of what I send.
I'll start by submitting the independent clk patches.

I can test your patches on an SG2000 board with an LT8912B (RISC-V
and ARM) and, once it arrives, an SG2002 MaixCAM with a native DSI
panel, and reply with Tested-by. If the design needs coverage on other
variants, I can add those boards to my testing.

> I have checked the PR and find it is very simple. I do not think it
> reflect the real hardware, IIRC it will be divided into several parts
> with phy/dsi/vpu/isp/pinctrl/clk.

Agreed. I wrote it for one board and it does not model that split:
one file covers the display engine, the DSI controller and the D-PHY,
and takes its resets and clock bits from the VIP syscon. I would
rather build your design than a second one. Thanks for the pointers
on pinctrl and clock-frequency.

> I also disagree with the clk data fix. Although it should expose a
> new div2 clock, the default configuration of DISP PLL should not be
> changed, but If I did make a mistake, please send this patch directly
> and I am happy with that.

I will send it as you suggest, in two independent pieces. The first
exposes the DSI synthesizer source gate and reports its half or full
MIPIMPLL rate; it may not be the div2 clock you mean, so its commit
message will say exactly what it models. The second is a small RFC
that only moves the DISPPLL lock poll from bit 2 to bit 18 (the SG2000
TRM v1.0 table labels 18 lock and 2 updating). It leaves the PLL
programming unchanged, drops the 0 Hz-until-locked part of the PR, and
comes with results from testing that change alone. If you would rather
keep bit 2, I'll drop it.

Thanks,
Nick DeTello
