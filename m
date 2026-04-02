Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF23630B3
	for <sophgo@lists.linux.dev>; Thu,  2 Apr 2026 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132961; cv=none; b=lJw9FwiEKEYTUy0d0eF/JVUv/fCzDBeIKG81FQ1P77xRE6g7u6BOP6sG4QnPEGSSwr+M9Ife8akCAa1uL0KQh2KFhmXI7Co5La3SHvWOmRKA7l3cuAJdhKxwLg8/aJWPtr2Y2VFq/7f8i2z9vQq+5NrWt/vLn7GIH8eLEIomcUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132961; c=relaxed/simple;
	bh=d7e7s7TnTP79BbzuyFXmjqDe5900yRh+zTsntc7JiEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZUlptszQWI+q0/lKWlNjhX/1dw+PgWn1ppfBBUpF+t9Bwsz2oB99BADnOCjerp7aDXiToQqAgAm87ZAxDRxNTNXgC2hA/1QkLQvMIsrV4HdyCAtAs2IOSdPMUAZ1hJ0pDoil5xfmwRoOCapMQCunx5eyRV119p5uD4LSF00rg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdO4Xt3v; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdO4Xt3v"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8d006a80ccbso105546285a.2
        for <sophgo@lists.linux.dev>; Thu, 02 Apr 2026 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132954; x=1775737754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=;
        b=NdO4Xt3vG7YIcLIXGJHnsGl0LHT5smTKWKW/TKAOGAszweZ79Rvmnp1oipWx+puwXj
         zP9lEW+C/2yypvLarajOGydiHE7OwdR3L0FyCW3L8qz5vzmKdpc0dRl1ONraksNhQOBZ
         bKFetAYAOEt/hGp+4YbQw7oe0YheJBoGxSekoJJbNIczF2qD1CfN4mnxi+8tTjNJPKgN
         oodRnyd06QFulU9em8JILciOCRtv3K+z4GhiZHSZ30YBfWVpOVMDDIP9jpXzuRjYo+D6
         OXe/2aq3+MrEllW3sAj7SG1bWeZyEzFfxwUtgU8HZGwiN9InvXhwV59AzPc+pdIj3Wwk
         LCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132954; x=1775737754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=;
        b=RRiywgAEfqjPaqxM5a+Qw7c2NZbPsmi/C9toy7IFgTeuyJ0NE0zdZ7or7piAwG9Q6q
         lezRh0Pmf465OPvRnPsqtw1uDsieSHsWVWHn2G6SOPmS4/OYFmUj3xhg4pEMZ7z2yMl7
         hRbcjH0wiGPGRR1Zy5iYOjKu/YOs7wtnQmZrwzfqjgRPouFuMLLIfOinKfU2OAshcctq
         NXZzh7o+SxAkfkOxVXCY4kPIlpjZDn7p3eoCb+SkIO6he5c3KPFY6nSdCeBDdrKUl/PI
         ti6IwqCqjmdhUvgN7qlwBVb/Lda4RhHBOu7VEHZdEDBrXM69aD15tidDrhA0/VFo95Po
         H0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXhoo6jURZ0EGcxbWS5cLgWPLJU/wRCYiUkeBSdGdlfArnDhAqwmoTQqSJbveyEDF1AdDC3crg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmuNaEKN1gFyKbjypmJaMKNCY/wqqXZQq0uG2ZCSoAgje3H+/g
	6t6llSOiHasA9vFYTzF4unHa1YfmaBU559J6b97i2qZkUpudvcjKGW9x
X-Gm-Gg: ATEYQzy5iPpyBcTma+m6DJitYRXTmFLwwOafWY5DCkzjEnaP7IcK+ZrkSJCF66s2j3V
	mhYjuiLJzxMKTRwX2vB9xb1OSCoyOPcLkCI21ky0FYRwiWwSWdrWm/663fNzDuvuNyIQnOxENdc
	4BPA11XLUsNMVj4kyJCoXL0+aO/JfZzgx4/zMLtg/tVm3bspudKRJdhHhGp+NUSRM2fDs+BInkh
	dQvcM/UqeuNULKnFrjzPYvzoLH8UzP7/KnI/Go9Jp9i8duMKal4eHTtYx0zrqegzRwRwhUANhbr
	du/qfnDtBPRLdc8ZCtgi/GHhPjz6abHKvQKxGEv4Y1JbVZFIW8tq8p0ZqJhV7q/8taRoSDg1RVW
	I8dVGSK8pJQoRJ2TfHQiDcan0M2SBHnsHFJgLUSdZg3R9hNxVHjU+U9i2Mra3GOTiTuHgmfhI8w
	3VKRzd2/HvkeYhhyS+2QfRwIiXVEjNuFhkl3aR7RxvH2fBfFmDhSZVU3vR
X-Received: by 2002:a05:620a:4802:b0:8cd:b38d:be7a with SMTP id af79cd13be357-8d1b5aac3a6mr1091790485a.4.1775132953851;
        Thu, 02 Apr 2026 05:29:13 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8647b4esm202845285a.32.2026.04.02.05.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:29:13 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:29:10 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com
Subject: Re: [PATCH v4 0/5] Add initial Milk-V Duo S board support
Message-ID: <ac5hFgLav_4oB2QA@sleek>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>

Hi Michael,

Thanks for testing this. I am not seeing that issue on my arm64 or riscv side.
I am able to add an IP and do anything I can think of on the arm64 side.

[   96.618687] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   96.633977] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   96.676436] dwmac1000: Master AXI performs any burst length
[   96.702852] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   96.748740] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   96.772880] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[ 1359.377528] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off

I can do the same on the riscv side but get a unhandled signal for TLS traffic
which I believe is unrelated as it doesn't happen on adding an IP.

I'll send over my configs to see if that helps.

Have a great day,
- Joshua Milas
