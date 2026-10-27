Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090830;
	b=FRV1382AYtEbWL8LYW2ixebpr5d3e432THuvmtSAOvvEFVw+fmLOdT9PCFxedHhp81zr
	 uZJ+C4XqAlA3rH0qR3QVpQH7/fzyNqZ1XzRDgwvCRIPFqFIbALi/Vg+alBvuYLaeEFXjd
	 NRJ8Be+m7ZZA4n9qxXjAgMD63xO0FNbSlqcEw+qErw6dQSx0GQHknhlphUaLt8gDip6Lt
	 p3OIIpxvlj93EMPmuSZ/t4clyFJGSK5ZV7/wenaMPNqaDEFkPM6qqYVt+7cqzE9xlt12B
	 Tyh3SCHtb5+oFhuRNX3x7AP+nQNVfnsEU6T2XbL3XVjJ+wFGg5jtmguKOGfMYBYsrOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i+o/Ogh7OkhJ7ulU7tj1FMuR3rbB8QMu6VFlxEY7V9k=;
	b=0QV3aoCwW8eRKBmf7NR1yehD+nniWKsdJ4KwuhcJL0QUuYnqEzPEAr7yvH7CSKrEPv/D
	 O0FB+fC39I1+xUMDA1uhrcPzcWWHXz3gkq4etuWVSWzCL4vNUTmrgH44BnkS8/kRqOXfy
	 fYhNRYrWFFscEl/hipRtxJDN9AFQ3TinFrTENFm462VywP+0M+xbFwCNt25/eoaFPSxHz
	 1WtEBlmgDPVqaGlPoQFhJusc9ZPvY3IuzUFk0nfsSmlEd7km92lE+HJY4gOvHZ7ydsiwJ
	 Kqbt/d2uZiixuDbx3AXVE8eXWT9M5jg8/FYS4CCL8CS9eMocI7tkh3HDsVD1sqe3fbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mTsggKdd;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721DD606A31A
	for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 08:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mTsggKdd
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1598023b3a.1
        for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090830; x=1793695630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+o/Ogh7OkhJ7ulU7tj1FMuR3rbB8QMu6VFlxEY7V9k=;
        b=mTsggKddu2TB3GCoNtGx0KfFS6DwugEdku8ic55N8kX/b/MQquYkaufHY6wHdFjz3x
         Xi1GWRh3DV0XTOI7g3UPJPQlv2d37sEdONmMrMfhnp5plHkDLHB0kiu2BwjP4B/O4cl+
         lWBtv5tNpB7w7hmg4b9iJZ2amgmO5Txxq/vPaoQ0ERc15RvHxZq5ZZ3vpXaGW4TLQd7Y
         OTbCB0P+rd883LBlMnHVzsgqcgnBhvuI+wvKNcIW7VqgTELEXdXcD5b3LCYo3TLSiHF1
         0ZPMGNsEF9Q0TenhYG+yq4IwOe/8q9f4A+wuYGOK+aDoBuk9e6y6simy79t1h3eYZg1P
         zpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090830; x=1793695630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+o/Ogh7OkhJ7ulU7tj1FMuR3rbB8QMu6VFlxEY7V9k=;
        b=F7T+KbwU0/QMRB+i4i6JrjvAMrGFa0x2fjSkp90mt1DYLSDPFFScJS6vS0S0W/P5Yq
         BCxULbG8LXTkj9zp17/fFON+ybvCrmY3NSTPZUfqSnhb8kRDkKSzRpZ95ShfuGZ4kdrv
         KeMn/wouQvbPlit8pB2c+c3I6WAJHv+m3bjiYr1Aa8/raRTZz+QsSOuT3TiUdqS26qU7
         MVtiBapwjz4VAp5oCjClVrcN5uwx68sYKvzyUcv5L+6f31Er6p0xW7yeF7BDXicxCAJm
         70M0FwfDxYspnmq5c1C/Obf7lOs4aoclGlP3rkgHZCaN3QsIPza718hH/0xTGPw9RSn6
         dAxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXym/F4GtKVaas2UxbT+//BjBDiINq1wcj0O4dNECB6d72fzzHPv1YGGlK7vqviDBCP3tIJ7I=@lists.linux.dev
X-Gm-Message-State: AFq9FYIQv4BzflyuAAEhmoUVK7xPNkytFCRCB081ThSTdH9+tfo8psK7
	UMQGq78GERtzkGScDvOQ3NlDR6O+UOfYsYR3YtCsWi6i/RVhww/CzkNN
X-Gm-Gg: AYBFou2gk62Jt8KdDaht1rXXGXoBlENewjjJrWjSljcOYB2bb9qe5Uq+JBPtJXXggy4
	2S7s3na4vl39B/ABy7fSP4HhUmN/+yYiAFtWpFz+/0HuYOutrFEIVSbirFYnP9azFcWKcrRJjPX
	nsNfsUuHV0dtRA0KuMVvOm3bcFVgOrhkvFj/DHvpP3lHuvaQ6/h7fYuNBjUTX2BjVF4xvsE1wP6
	BxFQhJGi6nwzl9RifQSyDvoK5jaeUAs8mISPXEAWZZ7+IA3h75FUOMnYHxRskaNf23XwnzwVAV9
	+P49KCkyCdEUfkjPQz/oHR2sYyyr1XkvDLz3mQYsEJlXQCTLGWDjmRi7pefUajG7G4fp8ELzvDc
	cb0co8A8x+l4kaksp0PTjKGMARU5SYcJyAF87ndSUclgAaCsa7R0e09US0a6YgUO70b6OQXgxtm
	2Gp8lCG6GGgClqpAhZe/NIszB1L6m3Pao1yOIA7d+eYWrtNx4FGntegcbYOtHC/82B1TO2E6Tv+
	OyxHtD0ohV9WiCu57RBPQ0p8Yd7NEBLD8YsttEdh+2R1NBb+mC+1YIBJ/UoiQRQ9CpBcH279Q+3
	ur/MPvP2FS5uAuDtMvV/yUORJ94=
X-Received: by 2002:a05:6a00:4512:b0:89f:ed3b:df97 with SMTP id d2e1a72fcca58-8a369830839mr7261082b3a.51.1793090829802;
        Tue, 27 Oct 2026 01:47:09 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e51sm2186330b3a.6.2026.10.27.01.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:47:09 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:46:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <chen.wang@linux.dev>, 
	Hiago De Franco <hfranco@baylibre.com>, sophgo@lists.linux.dev
Subject: Re: Milk-V Duo 256M: USB peripheral mode works on mainline, how
 should dr_mode be handled?
Message-ID: <auBkJSpC-H_HQ9xK@inochi.infowork>
References: <at09avHegBuX6Evc@inochi.infowork>
 <20261027073626.975104-1-chenyou910331@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027073626.975104-1-chenyou910331@gmail.com>

On Tue, Oct 27, 2026 at 03:36:26PM +0800, Chen-Yu Yeh wrote:
> (Resending as plain text, the list rejected the HTML version. Sorry for
> the duplicate.)
> 
> Inochi Amaoto wrote:
> > In fact, neither is prefered, the right way to use dual-role switch,
> > but it seems like broken. If you want to fix this, feel free to do
> > that. If not, ship the dts with the behavior from vendor.
> 
> Thanks. I'll look into getting the dual-role switch working on CV18xx,
> so that one DTB can do both host and peripheral.
> 
> Could you tell me what you saw broken when you tried it? From reading
> the code, my guess is the PHY: with dr_mode = "otg", usb_add_hcd() sets
> the PHY to host mode at probe (ID override in the top syscon), and
> nothing sets it back when the role switches to device. The PHY driver
> also treats OTG mode as a no-op. I'll start testing from there.
> 

In fact the dual role switch can not init normally, it will produce
lots of USB error in startup if you enable debug information. The OTG
mode for phy need a hardware signal and the document is kind of messy,
I think it may need a line to trigger it.

> And to make sure I read you correctly: if this can't be fixed in
> reasonable time, do you mean I should send a dts patch that matches
> the vendor image's behavior (peripheral by default)?
> 

Yes, this is what I mean. You should match the vendor's behavior
as everyone starts from the vendor image.

Regards,
Inochi
