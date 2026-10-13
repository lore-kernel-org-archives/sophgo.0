Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F58339872
	for <sophgo@lists.linux.dev>; Tue, 13 Oct 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895757; cv=none; b=ArFYXuBh26Nje8GRsmuUC5/j35mVKTgGhHCyyuNSDrp4R0uRpTXOaoJd5ewjis65rw8lkfdrzvEOWQZAk9p2eSjq8HSoI8BC2la+2ZmrKcCfNnKfzJcGJd281kj6LvpFH7zZ5Hnku5enaE+VmM8hQcdrHy/mGS/nkMmWDjgz6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895757; c=relaxed/simple;
	bh=1lj31HeXa69jItxDxDL9HohtbmQ56rG8/gJS9xSPmg0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=qu8qCW8BKxrYwdnWFGcngdcUzS2bQV/Zm+z4pGuKO22Jage3IGmgQZRi1aGguSk7w+TtMust+f7ELZqaP2Fsm/woi2ilJ1Qbt6uQftS85EepjuY3jktPEUlE27MdZj03gcrl3HqazaMsENgnungMe1WShtWbL+cQq2qhSPkhfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=detello.com; spf=pass smtp.mailfrom=detello.com; dkim=pass (1024-bit key) header.d=detello.com header.i=@detello.com header.b=mnOaGy74; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=detello.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=detello.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=detello.com header.i=@detello.com header.b="mnOaGy74"
Received: from webmail.porkbun.com (unknown [52.88.61.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: nick@detello.com)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 28B79422757;
	Tue, 13 Oct 2026 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=detello.com;
	s=default; t=1791895755;
	bh=D8AyAKw905aeq2Nq8z0ftkJ08U8HBzPXk/q7kIstOP8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mnOaGy74ReVihJKHNhFEmWuYDCiwzOMpr4IpjKWlEgdqIN0LLckfv0JhtzOR77Mo7
	 UeBmdQ3d9ZRqt2X3ziF0/0herFPKwhc8FVi2bB5RtiQf3hyrbR5Bq4SCnpj4sLi6OR
	 hhX9v6wSaCv5nm4Vd3OJFa+sMtCDkaa90r7V1jGQ=
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 13 Oct 2026 08:49:15 -0400
From: nick@detello.com
To: sophgo@lists.linux.dev
Cc: unicorn_wang@outlook.com, inochiama@outlook.com
Subject: Re: SG2000 display: DSI host + LT8912B HDMI working on v7.2, intent
 to upstream
In-Reply-To: <cdbe4812564fe417b8a7321e035cc7b3@detello.com>
References: <cdbe4812564fe417b8a7321e035cc7b3@detello.com>
Message-ID: <817ee00d07821f32f11fa0fdf961540c@detello.com>
X-Sender: nick@detello.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

(Resent in plain text; the list rejected the HTML copy.)

On 2026-10-13 02:24, nick@detello.com wrote:
> Hi Chen, Inochi,
> 
> I have the SG2000 display path working on v7.2 with two small kernel
> patches: DISP, DSI MAC and D-PHY driven by a new DRM host driver,
> through the in-tree lontium-lt8912b bridge, to HDMI at 1280x720@60
> over
> two lanes. It's tested on both cores (RISC-V and ARM) on the Nix Badge
> 2.0,
> a custom board around the Milk-V Duo S module: console on HDMI and a
> 15 fps framebuffer animation.
> 
> Two questions before I prepare the submission:
> 
> 1. Is either of you, or anyone you know of, working on the VO/DSI
> block
>    for cv18xx/SG2000? I would rather join than duplicate.
> 2. Any preference on where the host driver lives
>    (drivers/gpu/drm/sophgo/?) and on compatibles before I write the
>    bindings? The branch uses sophgo,sg2000-dsi and a
>    sophgo,sg2000-vip-sys syscon, and adds one clock ID
>    (CLK_DSI_SYNTH_SRC) to the cv1800 binding header.
> 
> Code, as one reviewable PR against the board's NixOS repo:
>   https://github.com/NixVegas/BadgeOS/pull/8
>   Driver:  pkgs/video/sophgo-dsi/src/sophgo-dsi.c (~1,500 lines,
>            register provenance from sophgo/osdrv cited in place)
>   Patches: pkgs/kernel/patches/ (clk-cv18xx: poll DISPPLL's real lock
>            bit and expose the DSI source gate; lt8912b: do the bridge
>            setup in pre_enable, between the host's LP-11 and HS)
>   DT:      pkgs/firmware/dts/sg2000-milkv-duo-s-common.dtsi
> 
> Planned order: the clk fix; display nodes for sg2000.dtsi and for the
> Duo S DTS Joshua Milas's series added in July; the DSI host as an RFC
> to dri-devel; then the lt8912b change, which as written is specific to
> this host (fixed HDMI mode, LVDS and PM paths dropped) and will be
> rebased on Maxime's atomic-callback conversion on drm-misc-next before
> it goes anywhere. Known gaps before the RFC: fixed mode (no EDID, no
> hot-plug; HPD goes to the bridge on this board), no vblank interrupt,
> and register sequences reproduced from the vendor driver rather than
> modelled.
> 
> Happy to share a video, serial logs or register traces. The driver was
> developed with Claude Code assistance; I have read and tested every
> line and will carry the review.
> 
> Thanks,
> Nick DeTello
