Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393783451BB
	for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908320; cv=none; b=Ia9WHRu2UpPb/80jJuLq5IytEwVqPm8oRBZqN8SbdkQJvdx2rwW7zAVSYeo5XtODYsS4dFH85SOMfHqfnNp9QXqd2eQzx32Ibm7WShaQ5xWSLF/kZetNKiUpYkjuxQaRk5PLvSdZKL821bKunnk4pc+vdzqptUqNo8qc+NlR3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908320; c=relaxed/simple;
	bh=G11yOThvw8ivZMg6xvJnmxWZPCz5hKcyxYMZzb8fEaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upF4kBCbpJqhfRY0SflAXnhcDVAm3U2okCC4b4Pp6MyMT4LpMI2kP/EsgfYrK4TbpUMB5slgPFFp13oR6wztC71c5ykvVDWhwZeFGtl8EYlj/m/uJHZsYLyC737haW5YutGhdddkiqeLFgoIgRP5qhsbCyIT1z4s9YvxOyqhjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs7iq3eb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs7iq3eb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so35061155e9.0
        for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 10:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765908317; x=1766513117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOVTvVNdR1FG9BDCa9ncqVORVzbhxwnhnkEQ2N326Mo=;
        b=Bs7iq3eb6AsecPWDqU1ZfHD3sCmSsmju+3jrtcBDw9vI7kxxlnYAA8wayTxDiiVPO/
         /HkZk11AVLqMR6lEJ2MZJsC1I91n+s3JjOG6Ssu9+kRG524u339vWQR/bGiDWIyhCALb
         CHUkuUOFhQrDW0iX0m4mn8RQUONKNAvt8FwK0XlujR0aM1YKRDGm+khbuJERCCfz/8MG
         0BaqIEshABoGc/K5PYOC2C0CbkjNKQV4mTeFVgp6kyVtoKmNr+k9AfgH8VP/acSJj7n4
         cWArzr5l7clNWgU2631NArGMzqU9PbjTjZms5vc/w4ZQKyQO4Cp/dfm7AxtUCNfS58Yx
         n0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765908317; x=1766513117;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOVTvVNdR1FG9BDCa9ncqVORVzbhxwnhnkEQ2N326Mo=;
        b=JdoqR1/qxHMb5tHHdYdrd2M9F3seUfUpOcWAMIIf2dRbaCHuIdbVs66VKO2ZnANKUH
         bSVUapLz2GDPNl/EN4FNlOfcWAwrYX+MadsDyk4Sqj3AI2YFOISy85soQw+CEEWecSdX
         UC5WYzMjEhXfJPjRl9WqXMLM7HYe/Vy/x5PnhYe38hwQJMbBrkWat1GjIfU34YF0BRyb
         QYLH9gXCrlo0y/Q/Cv98SJE/VMboeFLMIoM73WXmcP7DssDrwyu+T3evchtwxRYwzG3s
         oEQKZELUYsXCn1qHRKqQH6U+DplJ2DUj3pUeIc/7G1ZnKztnE9NHZThWztOlmgHjRjAw
         su/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLovTEQcsYkt5JANyRwV5bpp3VBORb0on3mviaE3Hgwxde0fASJoiPc/2Qdg+rk3/e1ofA4GE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTQ76v4eXrIpkTmfrS13Cmlc9TrOCe2K9g1LfMKmVRXbmKfUda
	dyQtHrogozSm3w2ZeczcbHlEIYeEq9tSneDlI9mwzspm3XBkRhbuoT/7
X-Gm-Gg: AY/fxX55i9TqEIUKyB+d+aDEW5FBznk1Ya0lhMK8Sg8JUwjLk2k6JIrgwOp01zradBi
	hg0F4x8Jfgd9JM61/KBp9gGzqwHkmyOXlP5P/7WGE2vFNtquaWlGkjJ+9q5uOzKHsf9+BwiYdtH
	7JDyXPEJ3PZT4xr0Aw2E6ZLFJmyrMz8s2zyhyjf8eC7VEKk3yTI3leQ9GKId9/Q8/Ifite2NVtJ
	TuKh/oOxW5mGMW++VoZM/dzsUXQp7AxiFZOpUEBj7I3CGjPpO+r1hQGfjE7gxYDM56IbuGlpgPp
	9jmGHryCoywQ/5gd7BE2/rw2X6vFeFWD0ztrTdtHy5p00nTd1gYtxmZEOJ3gZEMqzBJO/a9IABj
	YT3lkfkVRkc20j8kFfRfqp+IiO8nL+P6WvMlLdeuN5mPDEMm9qoFJ2uf6alROrGMra0S4uPeO/U
	2sheLgUrNy3/PCmHeadUp9n8iUay+Dtw8Xccvdn8Kv1G7UI6iGaMc9
X-Google-Smtp-Source: AGHT+IHcp2kh+mNII7OE1JHRsuXQc+60t2y2lkbG7uOLLemuoRbIqLfM/QxfUUFPTPf2nXNDwVnhkQ==
X-Received: by 2002:a05:600c:4f90:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47a8f905680mr161568895e9.17.1765908317137;
        Tue, 16 Dec 2025 10:05:17 -0800 (PST)
Received: from anton.local (bba-92-98-207-67.alshamil.net.ae. [92.98.207.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e1ebasm1784605e9.8.2025.12.16.10.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:05:16 -0800 (PST)
Date: Tue, 16 Dec 2025 22:05:12 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <aUGels35MP_BNjRC@anton.local>
Mail-Followup-To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-2-inochiama@gmail.com>
 <A0AF03A6-1F0B-462D-A088-3B4DF6BA6292@gmail.com>
 <PN6PR01MB11717B13B2AE78DDD36D2F0BBFEAFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN6PR01MB11717B13B2AE78DDD36D2F0BBFEAFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>

On Sat, Dec 13, 2025 at 08:53:34AM +0400, Chen Wang wrote:
> 
> On 12/13/2025 2:48 AM, Anton Stavinsky wrote:
> > > The DMA controller on CV1800B needs to use the DMA phandle args
> > > as the channel number instead of hardware handshake number, so
> > > add a new compatible for the DMA controller on CV1800B.
> > Thanks a lot,  Inochi. I've tested on my Milk Duo 256M board.
> > Seems to be working with the I2S driver, which I'm working on right now.
> > No issues with DMA interrupts anymore, DMA router used right channel.
> 
> Thank you, Anton. Could you also add a "Tested-by" signature?
I've tested the v2 https://lore.kernel.org/all/aUF4w9sO5lmU9T6v@anton.local/ Hope this will help. 
Thanks for pointing me. 
> 
> Chen.
> 
> 
