Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B471A6839
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 03:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947201; cv=none; b=NWwPHNycELZNUY+mTa8UeYFOT+Uj0Vk/l8M07gxOv1EWha1ecsC0wz+fTWdXXXZ8Bdni4ijplWw4Kc+poHp58OwinKzQCnREbXAcHKov6BkX+FH22ds9IUQetQOBA0wJERk4optEiVDli7wuZqqeqFJs+nYCuDg+1adDe0Ln70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947201; c=relaxed/simple;
	bh=wrU49i54gbgsCiSeEN4b9X8XoOIRO+IwwvLu9hNapfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVYM0wHB+4ScZ1/2bjIl5Ba1OASwQcBB4OV95swL9gmkUl3tD4re0RqtB0I3lxkFQofHNIn4dXxcIIYGVXkfts0/Q/kCdYXGCuNlAmD1q87xaZ3ayk4ZrGRxgo7G50GhiTHZFVfGjJ5OFJr2tK3q/3PK1V9wJlvoIKnj6Ojc9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iycTbMMf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iycTbMMf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8662d5e95so3599945ad.0
        for <sophgo@lists.linux.dev>; Tue, 13 Oct 2026 20:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791947199; x=1792551999; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z22K/u1sQteXL1o1/lvjqXaKD+e8BVkfVudkX3qf6HI=;
        b=iycTbMMffWFn3BuTCMFBjwPtCqaGAK36rBuIZ4tjM3u7YuRCvf0baWFM//ysD8QbY1
         P/ubHZZNL6JwWHYLM2nSHG1WLQ72712ttkTsKviHQiJU4WhI06DIceG7WrC2U0joDZ0T
         ap68FCP774IMvqvFrXUzCd71xwyHRzbHlLpQeY90CGdg446TPR5vN/6xmmZfcrEB2gZ0
         lrmb6oQgGiMd/sExEvc5U3Q2TZpf5awlNkNf8o6Hr3K14acevb04rZ5+KuzPRpO2Rs0L
         HShVCJ+ZF3ZIpe5Ug+Pez/Ajkm31SlyOD4ZUaY6CsEOaVEHwQAgZDN/oio+qe1BdHBGw
         Nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791947199; x=1792551999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z22K/u1sQteXL1o1/lvjqXaKD+e8BVkfVudkX3qf6HI=;
        b=ri+N/ytg9AI1o7uIcKMXXyzlIsFsPu1EGlTqwphOHDpXAqPkdGpUwWH4F+OpZ7Gnil
         rRmcGtaRHehIBzUhrZ9XiUYcNL5yJaOLVMZ0X5MsdxtLjepmYXGCOMR8D7mPoEZpAwv8
         9vcHlmv8oUQnnemZuLXYCPa20KYxCBCw5imRTjwk1YuhRg0Je+3L1tuVByhE2bm5aSp0
         zx38uqjNlNXIPguCg3qJC0lFkWFQs23YBevXBIKfhKFaS+oMl6XZ9NXd20VWXX0RjAxj
         cUzYj6MrfdJtZ2GvSjlbVDv+DTnR+xSfWS0EtKezWO4wdDF9OB5PSQBSxWUD5lyxLrMV
         orfQ==
X-Forwarded-Encrypted: i=1; AKwUvByqHzyxsfSTdSn4ye8q/PwGYpUGkHx4JxP0kvuv5SHrpVCxcHrFAq5QqodDiwOl9q5E6xtaMOk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLkaWlK4H+hHCeN5Yoi0/NfMWgIhbOFFsjpgJm8niLhdjEwjuYG
	4Wl6H+/ydZthNVs0a54tSOyz8esMImBpZjAZ9KHVUBsXpP03U74sau9L
X-Gm-Gg: AYBFou2HadT5QpdjSakgJHRHwW9iEiK4E9Oz0PfEPrb4nxHxs0qjVb1eKhDHy65iKfJ
	LHSxl9HxxlOsAjIk/WUwMQBXMut46NzmTHsSn5GhWYYuOllVKhDjZdGcZrZHMM7EWUWGJlkPIwe
	n+zBbf/fDDhdjJlCL4Zlaswhi37WnCJdz2w5bbRbhQ4+hJ3Iyx2q6SCT3Gw6dJ3mafxSqhRAISx
	yBXkYIGyxhiutV2c950Mt9HhHj4ne+1MOwp83FaexaUtH8f+zbv2hUygFDWNO3N51kQuE5WRIxi
	orCc3doyjNxIWrTTLLwz2bm3bZG6sZ2bzc2ewlaAs2qZvzI2L1Mcp/Bvrz7BrQYlsZV69EuzItF
	Z5xJBhKojaafSNHq7GsfmRZut0X5faPeaYtlgq/pCoxP68VtT1dIUZ3FFFDXALCGF3HyIR7UDNp
	laU2gI+HfTJuDDUZ2oq5a7B0bVeA6V09xylWID0m3YGkVrEzMy94AfDqKXVBSfs9QUae6T
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr120885635ad.50.1791947199152;
        Tue, 13 Oct 2026 20:06:39 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e20d2sm62722805ad.77.2026.10.13.20.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:06:38 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:06:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, nick@detello.com, 
	sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Cc: inochiama@outlook.com
Subject: Re: SG2000 display: DSI host + LT8912B HDMI working on v7.2, intent
 to upstream
Message-ID: <as7tp4C3SDCSq6DS@inochi.infowork>
References: <cdbe4812564fe417b8a7321e035cc7b3@detello.com>
 <817ee00d07821f32f11fa0fdf961540c@detello.com>
 <MA5P287MB6080428F77038F40E008D314FE9D2@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA5P287MB6080428F77038F40E008D314FE9D2@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>

On Wed, Oct 14, 2026 at 10:43:12AM +0800, Chen Wang wrote:
> Adding inochi's gmail address, which is the email address he currently uses.
> 
> Inochi, could you please help reply Nick on this?
> 
> Thanks,
> 
> Chen
> 
> On 10/13/2026 8:49 PM, nick@detello.com wrote:
> > (Resent in plain text; the list rejected the HTML copy.)
> > 
> > On 2026-10-13 02:24, nick@detello.com wrote:
> > > Hi Chen, Inochi,
> > > 
> > > I have the SG2000 display path working on v7.2 with two small kernel
> > > patches: DISP, DSI MAC and D-PHY driven by a new DRM host driver,
> > > through the in-tree lontium-lt8912b bridge, to HDMI at 1280x720@60
> > > over
> > > two lanes. It's tested on both cores (RISC-V and ARM) on the Nix Badge
> > > 2.0,
> > > a custom board around the Milk-V Duo S module: console on HDMI and a
> > > 15 fps framebuffer animation.
> > > 
> > > Two questions before I prepare the submission:
> > > 
> > > 1. Is either of you, or anyone you know of, working on the VO/DSI
> > > block
> > >    for cv18xx/SG2000? I would rather join than duplicate.

IIRC, there is no other ones, maybe someone has done similar, but they
are not opened and I am not sure why.
I already had a plan and finished bindings, but I am in bad health so
I have limit time on it (and this is why I may have a bad respond time
in LKML). The driver is a hard thing as I need to cover some SoCs with
simliar design.

> > > 2. Any preference on where the host driver lives
> > >    (drivers/gpu/drm/sophgo/?) and on compatibles before I write the
> > >    bindings? The branch uses sophgo,sg2000-dsi and a
> > >    sophgo,sg2000-vip-sys syscon, and adds one clock ID
> > >    (CLK_DSI_SYNTH_SRC) to the cv1800 binding header.
> > > 
> > > Code, as one reviewable PR against the board's NixOS repo:
> > >   https://github.com/NixVegas/BadgeOS/pull/8
> > >   Driver:  pkgs/video/sophgo-dsi/src/sophgo-dsi.c (~1,500 lines,
> > >            register provenance from sophgo/osdrv cited in place)
> > >   Patches: pkgs/kernel/patches/ (clk-cv18xx: poll DISPPLL's real lock
> > >            bit and expose the DSI source gate; lt8912b: do the bridge
> > >            setup in pre_enable, between the host's LP-11 and HS)
> > >   DT:      pkgs/firmware/dts/sg2000-milkv-duo-s-common.dtsi
> > > 

I have checked the PR and find it is very simple. I do not think it
reflect the real hardware, IIRC it will be divided into several parts with 
phy/dsi/vpu/isp/pinctrl/clk. And your driver only contains some of them.
If you take these thing with a whole view, you will see they are things
that work together.

I also disagree with the clk data fix. Although it should expose a new
div2 clock, the default configuration of DISP PLL should not be changed,
but If I did make a mistake, please send this patch directly and I am
happy with that. ^^.

Sorry for no detailed information, The detailed datasheet is not opened,
they are only opened to the trusted one, So I can not share you with the
detailed design and how the device is co-worked. But at least I can told
you, you may need pinctrl and clock-frequency properties to all display
node.

Regards,
Inochi

> > > Planned order: the clk fix; display nodes for sg2000.dtsi and for the
> > > Duo S DTS Joshua Milas's series added in July; the DSI host as an RFC
> > > to dri-devel; then the lt8912b change, which as written is specific to
> > > this host (fixed HDMI mode, LVDS and PM paths dropped) and will be
> > > rebased on Maxime's atomic-callback conversion on drm-misc-next before
> > > it goes anywhere. Known gaps before the RFC: fixed mode (no EDID, no
> > > hot-plug; HPD goes to the bridge on this board), no vblank interrupt,
> > > and register sequences reproduced from the vendor driver rather than
> > > modelled.
> > > 
> > > Happy to share a video, serial logs or register traces. The driver was
> > > developed with Claude Code assistance; I have read and tested every
> > > line and will carry the review.
> > > 
> > > Thanks,
> > > Nick DeTello
