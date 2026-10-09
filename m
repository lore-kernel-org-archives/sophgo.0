Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A236B92F
	for <sophgo@lists.linux.dev>; Fri,  9 Oct 2026 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539263; cv=none; b=n2KYXACRW5zFGr7ccdBFObm1Of3RJ/oMXggrJ2VI6HiJHiC+O16+L8Utm+MzTYsnIej+WMEYql6lOCxbqItIMCiUpPrgCrbqMnMhp1mdL/4EkWziD59eGx5RWm7ldzrMh5eLDEabRHJKlsppwDxkpp0ahOtSHhmivdhrUU9icj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539263; c=relaxed/simple;
	bh=b3E2k84QQEGwtviD/HyyfH8SNZuxyZTPnb62hGODMfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k40rGiIj8atnep/nVyU+U4LSXm8GO9MvSxbd69qHxI5cSmxb7PnWZt8RSQPsIwhnb6hxrDB8j/c+A7wYhgZ6l9T/0xYOM0ewdLtTBQMTsv0f0pjSSIR9GVF1y+gowW1EBHroW38aSQ+9TVnOT2I4AjFdy2mi/OpmDQOnAGwzgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLMkanba; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLMkanba"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso9356285ad.0
        for <sophgo@lists.linux.dev>; Fri, 09 Oct 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539261; x=1792144061; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=OLMkanbaqebyDuLU4GxDcwQBlFvRoyMA6enIVvt00MIX5+UBM2vryFXigUSb/V/6as
         til1kkelE3RwB/EAN01D2mIVqCSrjJGyKhMZknio2rtpEEf++enB9ifvz0cpXXHPg7E1
         XbBJOi0edPA7bgTq0WzuS/I4GIONHCyeC5RYmxD1UPtOUVBsaYJjunAyomzqlNKkqy+P
         ZpahW+zsihthaOtC1P4wuMs3NC/aMjhk07WYzem05X93yeoSfzqlfgJetWhy1vMgtzu7
         qz+lKKT73yxk2gIogbfnvTjJbnRGrSGmzyb6vgvB25ECxnd88Y9Mzl4L+ib18Gr3J1/q
         Q62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539261; x=1792144061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=ul7pJZIKQQzqnfp+DbdCAGb+ULFOxZV38/5KRb+Z7JslVwS6y0YzWVwqS6s2XCQCdY
         oc4Ha7oTgFC2gCYq8CplzT4FbcGtdKt52jdXVoHT1SRHfnLRMKQ/NHvht8VVXLxlhZXf
         wReEqWiEE1gM8ESXV2bt5gqegpxx9kodotS4+58/PyQfQ4LV5A6nae0376SEL7Prtxe9
         XlirgLA8fxReLw+aEciJss5polmlMgToC/t3m322qZwq363IIyAKWqg4FVJpzu8Juxwj
         2n9SDvObKdsDJi3CyGkIkkqSKDNsw63bkDI1JvE9xSxY/L7sTPeEI9Hl4Drr9Ru13G/0
         BEWA==
X-Forwarded-Encrypted: i=1; AKwUvByCkzUEnEEOJwXYAb1+n04ZCdjqp7YBnW68SWQRBnIhPK19pJPhhlAgKcp1euXChlPxcGvjX8o=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRUtx00Tptsh+x2b9D0l7tzlEoEmlDIp004AtC0vwfjSX82NqQ
	5+9gN5XgHzXj8skRcs2g/OAYBHigCdUm2L8LvmzczBSxHlesy/BBoqaZ
X-Gm-Gg: AYBFou0qx1VHAtgDFM3tiLUbOuqeZO2H7iDPzAFLlcHYy/V83tg7Asb+KiBoPOxieUQ
	8SbjMDbmVrjUubfOKGP0MUXUgNreeP1tUcqp6wc+B/ET9U+lbHAM3sAOLVHWDyAMPUQuDBYWaJD
	WWaW4S43ulNsH9L8e2SurFI3ON7tS+f5LtvgTRgzCdmEMMiI8cGZqeoWDPwe/HpAJhrZkRgKY2x
	RoBvP6Zvz70Jqa36d8ISP0sUEv1MDJxn20CsoAZpW86/k5MuObcORz/6YCi9VM4Y7iJ6JGLlnSn
	i03ybd2x6dLoTlzcjYGPJVcOw2mafEopLciMtE8g/k1bU63UB43n89nzP9Zx4r5fbBTkHdt4RAH
	CARa1AjD6z2qhoSm1Dm3N0PasF3/Gi6keWAUJGmbp8YebbYf+ItFpAKQF3Ulrka5eA0Y8bpJEW1
	pnFeU7Xq4Mt6zNysvOZVqYA6btmNp4zZl715QyORWtVeWAQiRllhcwDtShwlc/tNAOIaf6
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr7768075ad.41.1791539260811;
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b17basm5833635ad.42.2026.10.09.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Fri,  9 Oct 2026 17:47:07 +0800
Message-ID: <179153921381.259252.9054877756385260471.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 17:37:47 +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v3:
>  - Rename the PHY node to ethernet-phy@1, as the commit message already
>    said; v2 only changed the unit address (sashiko-bot). dtbs_check now
>    validates the node against ethernet-phy.yaml, with no new warnings.
>  - Drop the blank line in the trailer block of 2/2 (Hiago)
>  - Collect Hiago's Reviewed-by
>  - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
>    name
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
      https://github.com/sophgo/linux/commit/627e4e43e555ba252f93784eafff74ed82234c63
[2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
      https://github.com/sophgo/linux/commit/673f8e66d5edf424eaf599c8051e0f6962605861

Thanks,
Inochi

